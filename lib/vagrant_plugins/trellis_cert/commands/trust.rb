# frozen_string_literal: true

require "fileutils"
require "optparse"
require "vagrant"
require "vagrant_plugins/trellis_cert/trellis"

module VagrantPlugins
  module TrellisCert
    module Commands
      class Trust < Vagrant.plugin("2", :command)
        def execute
          options = {}
          opts = OptionParser.new do |o|
            o.banner = "Usage: vagrant trellis-cert trust [options]"
            o.separator ""

            o.on("-p", "--path PATH", String, "Path to the Trellis root") do |path|
              options[:path] = path
            end

            o.on("-h", "--help", "Print this help") do
              @env.ui.info(opts)
              exit
            end
          end
          parse_options(opts)

          path = options[:path] || "."

          tmp_dir = File.join(@env.tmp_path, Identity.name)
          FileUtils.mkdir_p(tmp_dir)
          begin
            results = hosts(path: path).group_by { |host| trust(host: host, tmp_dir: tmp_dir) }

            print_success_messages_for(successes: results.dig(true))
            print_error_messages_for(failures: results.dig(false))
          ensure
            FileUtils.rm_rf(tmp_dir)
          end

          exit_code_for(results: results)
        end

        def print_success_messages_for(successes:)
          successes&.each do |host|
            @env.ui.success("#{host} certificate imported successfully")
          end
        end

        def print_error_messages_for(failures:)
          failures&.each do |host|
            @env.ui.error("#{host} certificate import failed")
          end
        end

        def exit_code_for(results:)
          results.dig(false).nil? ? 0 : 1
        end

        def trust(host:, tmp_dir:)
          system("openssl s_client -showcerts -connect #{host}:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > #{tmp_dir}/#{host}.pem 2>/dev/null")
          system("security add-trusted-cert -k ~/Library/Keychains/login.keychain #{tmp_dir}/#{host}.pem >/dev/null 2>/dev/null")
        end

        def hosts(path:)
          @hosts ||= Trellis.new(path: path).canonicals
        end
      end
    end
  end
end
