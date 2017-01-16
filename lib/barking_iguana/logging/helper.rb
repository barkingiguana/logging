module BarkingIguana
  module Logging
    module Helper
      def self.included into
        into.send :include, InstanceMethods
      end

      module InstanceMethods
        def logger
          @logger ||= Logging.get_logger(self)
        end

        def inspect
          s = super
          remove = Regexp.new(Regexp.escape("@logger=#{logger.inspect}"))
          s.gsub! /(?:, )#{remove}/, ''
          s
        end
      end
    end
  end
end
