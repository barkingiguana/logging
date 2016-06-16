require "barking_iguana/otk/defaults"
require "barking_iguana/logging/version"
require "barking_iguana/logging/helper"
require "barking_iguana/logging/logger"

module BarkingIguana
  module Logging
    include Otk::Defaults
    defaults default_level: Logger::INFO,
      default_target: $stdout,
      default_raw_append_threshold: Logger::DEBUG

    def self.get_logger for_instance
      Logger.new(default_target).tap do |l|
        l.level = default_level
        l.formatter = default_formatter(for_instance)
      end
    end

    def self.default_formatter for_instance
      name = for_instance.class.name
      id = for_instance.object_id
      label = "#{name}##{id}"
      lambda do |severity, datetime, _progname, message|
        "#{datetime.iso8601} #{label} #{severity.ljust(5)} #{message}\n"
      end
    end
    class << self; private :default_formatter; end
  end
end
