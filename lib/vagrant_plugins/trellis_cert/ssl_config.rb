# frozen_string_literal: true

# TODO: Require actual Trellis::Config dynamically after roots/trellis#890 is merged.
require 'vagrant_plugins/trellis_cert/config'

module VagrantPlugins
  module TrellisCert
    class SSLConfig < Config
      def wordpress_sites
        @wordpress_sites ||= begin
          super.select do |_name, site|
            site&.dig('ssl', 'enabled')
          end
        end
      end
    end
  end
end
