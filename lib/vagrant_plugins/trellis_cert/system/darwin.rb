# frozen_string_literal: true

module VagrantPlugins
  module TrellisCert
    module System
      class Darwin
        def initialize(hosts:, tmp_dir:)
          @hosts = hosts
          @tmp_dir = tmp_dir
        end

        def trust
          @hosts.group_by do |host|
            system("openssl s_client -showcerts -connect #{host}:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > #{@tmp_dir}/#{host}.pem 2>/dev/null")
            system("security add-trusted-cert -k ~/Library/Keychains/login.keychain #{@tmp_dir}/#{host}.pem >/dev/null 2>/dev/null")
          end
        end
      end
    end
  end
end
