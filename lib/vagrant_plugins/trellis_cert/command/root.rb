# frozen_string_literal: true

require 'optparse'

module VagrantPlugins
  module TrellisCert
    module Command
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
          return help if help? || !sub_command?

          # Initialize and execute the command class
          @subcommands.get(@sub_command&.to_sym)
                      .new(@sub_args, @env)
                      .execute
        rescue Vagrant::Errors::VagrantError => e
          raise e
        rescue StandardError => e
          raise Vagrant::Errors::CLIInvalidUsage, help: "#{e.message}\r\n\r\nBacktrace:\r\n#{e.backtrace&.join("\r\n")}"
        end

        private

        def help?
          (@main_args & %w[-h --help]).any?
        end

        def sub_command?
          @subcommands.key?(@sub_command&.to_sym)
        end

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
