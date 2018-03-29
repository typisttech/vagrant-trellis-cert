# frozen_string_literal: true

require 'socket'
require 'openssl'

module VagrantPlugins
  module TrellisCert
    class Certificate
      def initialize(host:, tmp_dir:)
        @host = host
        @tmp_dir = tmp_dir
      end

      def download
        fetch

        File.open(path, 'w') do |file|
          file.write(@cert.to_der)
        end
      end

      def path
        "#{@tmp_dir}/#{@host}.der"
      end

      private

      def fetch
        tcp_client = TCPSocket.new(@host, 443)
        ssl_client = OpenSSL::SSL::SSLSocket.new(tcp_client)
        ssl_client.hostname = @host
        ssl_client.connect
        @cert = OpenSSL::X509::Certificate.new(ssl_client.peer_cert)
      ensure
        ssl_client.sysclose
        tcp_client.close
      end
    end
  end
end
