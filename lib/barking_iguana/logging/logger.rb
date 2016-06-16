require 'logger'

module BarkingIguana
  module Logging
    class Logger < ::Logger
      attr_accessor :raw_append_threshold

      def initialize *args
        super
        self.raw_append_threshold = Logging.default_raw_append_threshold
      end

      def << *args
        super if level <= raw_append_threshold
      end
    end
  end
end
