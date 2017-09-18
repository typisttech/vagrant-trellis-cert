# frozen_string_literal: true

require 'vagrant_plugins/trellis_cert/system/darwin'

module VagrantPlugins
  module TrellisCert
    module System
      def self.build(args)
        unless Vagrant::Util::Platform.darwin?
          raise 'vagrant-trellis-cert only works on macOS. Pull requests are welcome.'
        end

        Darwin.new(**args)
      end
    end
  end
end
