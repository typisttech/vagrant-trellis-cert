# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/system'

module VagrantPlugins
  module TrellisCert
    module Command
      class Trust < Vagrant.plugin('2', :command)
        def execute
          _options, argv = parse_options!

          @env.ui.info('Importing certificates...')

          hosts = SSLConfig.new(root_path: machine_root_path(argv))
                           .canonicals
          result = trust(hosts)

          result.print(ui: @env.ui)

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

        def machine_root_path(argv)
          with_target_vms(argv) do |machine|
            # Machine must be up so that we can download SSL certificates.
            raise Vagrant::Errors::SSHNotReady unless machine.communicate.ready?

            return machine.env.root_path
          end
        end

        def trust(hosts)
          Dir.mktmpdir do |tmp_dir|
            return System.build
                         .trust(hosts: hosts, tmp_dir: tmp_dir)
          end
        end
      end
    end
  end
end
