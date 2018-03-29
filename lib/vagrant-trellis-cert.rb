# frozen_string_literal: true

begin
  require 'vagrant'
rescue LoadError
  raise 'The Vagrant Trellis Cert plugin must be run within Vagrant.'
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
# Requiring 2.0.3 or later because of Ruby 2.4.2
if Vagrant::VERSION < '2.0.3'
  raise 'The Vagrant Trellis Cert plugin is only compatible with Vagrant 2.0.3 or later'
end

require 'vagrant_plugins/trellis_cert/identity'
require 'vagrant_plugins/trellis_cert/plugin'
