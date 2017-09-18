# frozen_string_literal: true

module VagrantPlugins
  module TrellisCert
    class Result
      def initialize
        @store = {
          true => [],
          false => []
        }
      end

      def add(host:, is_success:)
        @store[is_success] << host
      end

      def print(ui:)
        successes.each do |host|
          ui.success("SUCCESS:    #{host}")
        end

        failures.each do |host|
          ui.error("FAIL:       #{host}")
        end
      end

      def exit_code
        !successes.empty? && failures.empty? ? 1 : 0
      end

      private

      def successes
        @store[true]
      end

      def failures
        @store[false]
      end
    end
  end
end
