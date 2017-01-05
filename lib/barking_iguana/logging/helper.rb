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
      end
    end
  end
end
