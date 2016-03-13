require 'colorizr'

class Tribe
  attr_reader :name, :members

  def initialize setup_hash = {}
    @members = setup_hash[:members]
    @name = setup_hash[:name]
    puts "#{@name} created"
  end

  def to_s
    @name.to_s
  end

  def tribal_council immune
    @members.delete_if { |member| member == immune }.sample
  end

  def eliminate_player player
    @members.delete player
  end

end
