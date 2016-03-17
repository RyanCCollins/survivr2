# Class contestant
  # Basic and simple, contestant holds information about contestants.
class Contestant
  attr_reader :name
  def initialize(name)
    @name = name
  end
  # To_s returns the name to string.
  def to_s
    @name.capitalize
  end
end
