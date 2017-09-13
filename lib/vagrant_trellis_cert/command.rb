# frozen_string_literal: true

require "fileutils"
require "yaml"

module VagrantTrellisCert
  class Command < Vagrant.plugin("2", :command)
    def self.synopsis
      "trust all Trellis self-signed certificates"
    end

    def execute
      options = {}
      opts = OptionParser.new do |o|
        o.banner = "Usage: vagrant trellis-cert [--path <path>]"
        o.separator ""
        o.version = VagrantTrellisCert::Identity.version
        o.program_name = "vagrant trellis-cert"

        o.on("--path <path>", String, "Path to the Trellis root") do |path|
          options[:path] = path
        end
      end
      argv = parse_options(opts)

      @path = options[:path] || "."

      FileUtils.rm_rf(tmp_path)
      FileUtils.mkdir_p(tmp_path)

      canonical_hosts.each do |host|
        system("openssl s_client -showcerts -connect #{host}:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > #{tmp_path}/#{host}.pem 2>/dev/null")
      end

      canonical_hosts.each do |host|
        success = system("security add-trusted-cert -k ~/Library/Keychains/login.keychain #{tmp_path}/#{host}.pem >/dev/null 2>/dev/null")

        if success
          @env.ui.success("#{host} certificate imported successfully")
        else
          @env.ui.error("#{host} certificate import failed")
        end
      end

      FileUtils.rm_rf(tmp_path)
    end

    def canonical_hosts
      site_hosts.map do |host|
        if !host.is_a?(Hash) || !host.key?("canonical")
          fail_with_message File.read(File.join(@path, "roles/common/templates/site_hosts.j2")).sub!("{{ env }}", "development").gsub!(/com$/, "dev")
        end

        host.fetch("canonical")
      end
    end

    def site_hosts
      sites.flat_map { |(_name, site)| site["site_hosts"] }
    end

    def sites
      unless File.exist?(config_file)
        fail_with_message "#{config_file} was not found. Please run `$ vagrant trellis-cert` with `--path` option"
      end

      YAML.load_file(config_file)["wordpress_sites"].tap do |sites|
        fail_with_message "No sites found in #{config_file}." if sites.to_h.empty?
      end
    end

    def config_file
      File.join(@path, "group_vars", "development", "wordpress_sites.yml")
    end

    def fail_with_message(msg)
      raise Vagrant::Errors::VagrantError.new, msg
    end

    def tmp_path
      "#{@env.tmp_path}/#{VagrantTrellisCert::Identity.name}"
    end
  end
end
