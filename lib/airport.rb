require_relative 'weather.rb'
require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane, weather)
    fail 'Airport at full capacity' if hangar_capacity_reached?
    fail 'Unable to land due to weather' if weather.stormy?
    @hangar.push(plane)
  end

  def take_off(plane, weather)
    fail 'Airport is empty' if hangar_empty?
    fail 'Unable to depart due to weather' if weather.stormy?
    @hangar.delete(plane)
  end

  def hangar_capacity_reached?
    @hangar.length >= @capacity
  end

  def hangar_empty?
    @hangar.empty?
  end

  def safe_for_operations?(weather)
    weather.stormy?
  end
end
