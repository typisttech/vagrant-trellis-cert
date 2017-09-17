# frozen_string_literal: true

require 'optparse'

module VagrantPlugins
  module TrellisCert
    module Commands
      class Root < Vagrant.plugin('2', :command)
        def self.synopsis
          'trust Trellis self-signed certificates'
        end

        def initialize(argv, env)
          super

          @main_args, @sub_command, @sub_args = split_main_and_subcommand(argv)

          @subcommands = Vagrant::Registry.new

          @subcommands.register(:trust) do
            require_relative 'trust'
            Trust
          end
        end

        def execute
          return help if (@main_args & %w[-h --help]).any?

          command_class = @subcommands.get(@sub_command&.to_sym)
          return help unless command_class

          # Initialize and execute the command class
          command_class.new(@sub_args, @env).execute
        end

        private

        def help
          option_parser = OptionParser.new do |opts|
            opts.banner = 'Usage: vagrant trellis-cert <command> [<args>]'
            opts.separator ''
            opts.separator 'Available subcommands:'

            @subcommands.keys.sort.each do |key|
              opts.separator "     #{key}"
            end

            opts.separator ''
            opts.separator "For help on any individual command run 'vagrant trellis-cert COMMAND -h'"
          end

          @env.ui.info(option_parser.help, prefix: false)
        end
      end
    end
  end
end
