# frozen_string_literal: true

module VagrantPlugins
  module TrellisCert
    class Plugin < Vagrant.plugin("2")
      name Identity.name

      command "trellis-cert" do
        require_relative "commands/trust"
        Commands::Trust
      end
    end
  end
end
