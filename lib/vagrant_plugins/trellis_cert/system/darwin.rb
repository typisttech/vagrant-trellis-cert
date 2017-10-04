# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/result'

module VagrantPlugins
  module TrellisCert
    module System
      class Darwin
        KEYCHAIN = '~/Library/Keychains/login.keychain'

        def trust(hosts:, tmp_dir:)
          Result.new.tap do |result|
            hosts.map do |host|
              cert_path = "#{tmp_dir}/#{host}.pem"

              # Download cert
              system("openssl s_client -showcerts -connect #{host}:443 </dev/null 2>/dev/null | \
              openssl x509 -outform PEM > #{cert_path} 2>/dev/null")

              is_success = system("security add-trusted-cert -k #{KEYCHAIN} #{cert_path} >/dev/null 2>/dev/null")

              result.add(host: host, is_success: is_success)
            end
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
