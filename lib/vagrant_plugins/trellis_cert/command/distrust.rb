# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/result'

module VagrantPlugins
  module TrellisCert
    module Command
      class Distrust < Vagrant.plugin('2', :command)
        KEYCHAIN = '~/Library/Keychains/login.keychain'

        def execute
          _options, argv = parse_options!

          @env.ui.info('Removing certificates...')

          ssl_config = SSLConfig.new(root_path: machine_root_path(argv))

          result = distrust(ssl_config.canonicals)

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

        def distrust(hosts)
          Result.new.tap do |result|
            hosts.map do |host|
              is_success = system("security delete-certificate -c #{host} #{KEYCHAIN} >/dev/null 2>/dev/null")

              result.add(host: host, is_success: is_success)
            end
          end
        end
      end
    end
  end
end
