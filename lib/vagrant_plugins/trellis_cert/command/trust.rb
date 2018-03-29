# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/certificate'
require 'vagrant_plugins/trellis_cert/ssl_config'
require 'vagrant_plugins/trellis_cert/result'

module VagrantPlugins
  module TrellisCert
    module Command
      class Trust < Vagrant.plugin('2', :command)
        KEYCHAIN = '~/Library/Keychains/login.keychain'

        def execute
          _options, argv = parse_options!

          @env.ui.info('Importing certificates...')

          ssl_config = SSLConfig.new(root_path: machine_root_path(argv))

          result = trust(ssl_config.canonicals)

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
          result = Result.new

          Dir.mktmpdir do |tmp_dir|
            hosts.map do |host|
              certificate = Certificate.new(host: host, tmp_dir: tmp_dir)
              certificate.download

              is_success = system("security add-trusted-cert -k #{KEYCHAIN} #{certificate.path} >/dev/null 2>/dev/null")

              result.add(host: host, is_success: is_success)
            end
          end

          result
        end
      end
    end
  end
end
