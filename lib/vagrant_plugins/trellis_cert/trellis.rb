# frozen_string_literal: true

require "vagrant"
require "yaml"

module VagrantPlugins
  module TrellisCert
    class Trellis
      def initialize(path:)
        @path = path
      end

      def canonicals
        malformed = site_hosts.any? do |host|
          !host.is_a?(Hash) || !host.key?("canonical")
        end
        fail_with(message: site_hosts_example) if malformed

        site_hosts.map { |host| host["canonical"] }
      end

      private

      def site_hosts
        wordpress_sites.flat_map { |(_name, site)| site["site_hosts"] }
      end

      def wordpress_sites
        unless File.exist?(config_file)
          message = "#{config_file} was not found. Perhaps `--path` is missing or incorrect."
          fail_with(message: message)
        end

        YAML.load_file(config_file)["wordpress_sites"].tap do |sites|
          fail_with(message: "No sites found in #{config_file}.") if sites.to_h.empty?
        end
      end

      def config_file
        File.join(@path, "group_vars", "development", "wordpress_sites.yml")
      end

      def site_hosts_example
        template = File.join(@path, "roles/common/templates/site_hosts.j2")
        File.read(template).sub!("{{ env }}", "development").gsub!(/com$/, "dev")
      end

      def fail_with(message:)
        fail Vagrant::Errors::VagrantError.new, message
      end
    end
  end
end
