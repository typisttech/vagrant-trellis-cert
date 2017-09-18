# frozen_string_literal: true

require 'fileutils'
require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/system'

module VagrantPlugins
  module TrellisCert
    module Commands
      class Trust < Vagrant.plugin('2', :command)
        def execute
          options = {}
          parse_options(option_parser(options: options))
          path = options[:path] || '.'

          Dir.mktmpdir do |tmp_dir|
            results = System.build(
              hosts: SSLConfig.new(root_path: path).canonicals,
              tmp_dir: tmp_dir
            ).trust

            print_success_messages_for(successes: results.dig(true))
            print_error_messages_for(failures: results.dig(false))
          end

          exit_code_for(results: results)
        end

        private

        def option_parser(options:)
          OptionParser.new do |opts|
            opts.banner = 'Usage: vagrant trellis-cert trust [options]'
            opts.separator ''

            opts.on('-p', '--path PATH', String, 'Path to the Trellis root') do |path|
              options[:path] = path
            end

            opts.on('-h', '--help', 'Print this help') do
              @env.ui.info(opts)
              exit
            end
          end
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
      end
    end
  end
end
