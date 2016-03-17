require 'colorizr'

class Tribe
  attr_reader :name, :members, :color

  @@available_colors = String.colors

  def initialize options
    @members = options[:members]
    @name = options[:name]
    @color = pick_team_color
    puts "The " +"#{self.to_s}" + " tribe has been created with the following members"
    output = ""
    @members.each{ |member| output += "#{member.to_s}, "}
    puts output
    puts
  end

  # Picks a random color and then deletes it from the available_colors array.
    # Note that this will throw if too many tribes are introduced.
  def pick_team_color
    if @@available_colors.length > 0
      color = @@available_colors.sample
      @@available_colors.delete color
      color
    else
      raise NoMoreColoredJerseysAvailable, "Sorry, but we ran out of colored jerseys for the teams.  Guess they will have to go skins."
    end
  end
  # To_s will print in the color chosen when creating the tribe.
    # I think that is what the specifications were looking for?
  def to_s
    @name.capitalize.send @color.to_sym
  end

  # Convenience for eliminating a contestant
  def eliminate contestant
    @members.delete contestant
  end

  def tribal_council immune=nil
    @members.reject { |member| member == immune }.sample
  end
end
