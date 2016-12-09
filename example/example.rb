require 'barking_iguana/logging'

class Example
  include BarkingIguana::Logging::Helper

  def initialize
    @i = 0
  end

  def run
    @i += 1
    logger.info { "Testing #{@i.to_s.rjust(3, '0')}" }
  end
end

@examples = (1..10).to_a.map do
  Example.new
end

100.times do
  @examples.sort_by{rand}.each &:run
end
