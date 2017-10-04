# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/system'

module VagrantPlugins
  module TrellisCert
    module Command
      class Distrust < Vagrant.plugin('2', :command)
        def execute
          _options, argv = parse_options!

          @env.ui.info('Removing certificates...')

          hosts = SSLConfig.new(root_path: machine_root_path(argv))
                           .canonicals
          result = System.build
                         .distrust(hosts)

          result.print(ui: @env.ui)

          result.exit_code
        end

        private

        def parse_options!
          options = {}
          opts = OptionParser.new do |o|
            o.banner = 'Usage: vagrant trellis-cert distrust [options] [vm-id]'
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
            return machine.env.root_path
          end
        end
      end
    end
  end
end
