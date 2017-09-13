# frozen_string_literal: true

require "vagrant"

module VagrantPlugins
  module TrellisCert
    class Plugin < Vagrant.plugin("2")
      name Identity.name

      description Identity.description

      command "trellis-cert" do
        require_relative "commands/root"
        Commands::Root
      end
    end
  end
end
