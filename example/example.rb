require 'barking_iguana/logging'

BarkingIguana::Logging.colours = %w(red blue green yellow)
class Example
  include BarkingIguana::Logging::Helper

  def initialize
    @i = 0
  end

  def run
    logger.info message
  end

  def message
    (1..rand(25)).to_a.map { word }.join ' '
  end

  def word
    ('a'..'z').sort_by { rand }[0,1 + rand(10)].join
  end
end

@examples = (1..10).to_a.map do
  Example.new
end

100.times do
  @examples.sort_by{rand}.each &:run
end
