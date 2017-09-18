# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/system'

module VagrantPlugins
  module TrellisCert
    module Command
      class Trust < Vagrant.plugin('2', :command)
        def execute
          _options, argv = parse_options!

          # To get result variable after mktmpdir block
          result = nil

          with_target_vms(argv) do |machine|
            raise Vagrant::Errors::SSHNotReady unless machine.communicate.ready?

            machine.env.ui.info('Importing certificates...')

            Dir.mktmpdir do |tmp_dir|
              result = System.build(
                hosts: SSLConfig.new(root_path: machine.env.root_path).canonicals,
                tmp_dir: tmp_dir
              ).trust
            end

            result.print(ui: machine.env.ui)
          end

          result.exit_code
        end

        private

        def parse_options!
          options = {}
          opts = OptionParser.new do |o|
            o.banner = 'Usage: vagrant trellis-cert trust [options] [vm-id]'
            o.separator ''

            o.on('-h', '--help', 'Print this help') do
              @env.ui.info(opts)
              exit
            end
          end
          [options, parse_options(opts)]
        end
      end
    end
  end
end
