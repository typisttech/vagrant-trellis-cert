# frozen_string_literal: true

module VagrantPlugins
  module TrellisCert
    class Plugin < Vagrant.plugin("2")
      name Identity.name

      command "trellis-cert" do
        require_relative "command"
        Command
      end
    end
  end
end
