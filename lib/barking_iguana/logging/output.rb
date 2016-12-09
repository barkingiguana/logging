module BarkingIguana
  module Logging
    class Output
      attr_accessor :io
      private :io=, :io

      def initialize io
        self.io = io
      end

      def write message
        @bold = !@bold
        output = if @bold
                   Term::ANSIColor.bold message
                 else
                   message
                 end
        io.write output
      end

      def close
        io.close
      end
    end
  end
end
