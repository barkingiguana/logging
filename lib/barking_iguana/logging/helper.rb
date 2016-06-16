module BarkingIguana
  module Logging
    module Helper
      def self.included into
        into.include InstanceMethods
      end

      module InstanceMethods
        def logger
          @logger ||= LoggerFactory.get_logger(self)
        end
      end
    end
  end
end
