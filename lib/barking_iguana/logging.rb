require "barking_iguana/logging/version"
require "barking_iguana/logging/helper"
require 'logger'

module BarkingIguana
  module Logging
    def self.get_logger for_instance
      Logger.new(default_target).tap do |l|
        l.level = default_level
        l.formatter = default_formatter(for_instance)
      end
    end

    def self.default_level
      Logger::INFO
    end

    def self.default_target
      $stdout
    end

    def self.default_formatter for_instance
      @default_formatter = begin
                             name = for_instance.class.name
                             id = for_instance.object_id
                             label = "#{name}##{id}"
                             lambda do |severity, datetime, _progname, message|
                               "#{datetime.iso8601} #{label} #{severity.ljust(5)} #{message}\n"
                             end
                           end
    end
  end
end
