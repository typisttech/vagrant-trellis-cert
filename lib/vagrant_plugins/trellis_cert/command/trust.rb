# frozen_string_literal: true

require 'fileutils'
require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/system'

module VagrantPlugins
  module TrellisCert
    module Command
      class Trust < Vagrant.plugin('2', :command)
        def execute
          options = {}
          parse_options(option_parser(options: options))
          path = options[:path] || '.'

          # To get result variable after mktmpdir block
          result = nil

          @env.ui.info('Importing certificates...')

          Dir.mktmpdir do |tmp_dir|
            result = System.build(
              hosts: SSLConfig.new(root_path: path).canonicals,
              tmp_dir: tmp_dir
            ).trust

            result.print(ui: @env.ui)
          end

          result.exit_code
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
      end
    end
  end
end
