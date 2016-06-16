module BarkingIguana
  module Logging
    module Helper
      def self.included into
        into.include InstanceMethods
      end

      module InstanceMethods
        def logger
          @logger ||= Logging.get_logger(self)
        end
      end
    end
  end
end
