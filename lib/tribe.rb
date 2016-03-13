class Tribe
  attr_reader :name, :members, :color

  def initialize opts={}
  	@name = opts[:name]
  	@members = opts[:members]
  	@color = opts[:color]
    puts "#{@name} created."
  end

  def to_s
    @name.send @color.to_sym
  end

  def tribal_council immune=nil
  	@members.reject { |member| member == immune }.sample
  end

  def eliminate_player player
    @members -= [player]
  end

end
