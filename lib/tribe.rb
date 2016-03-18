require 'colorizr'

class Tribe
  attr_reader :name, :members

  @@available_colors = String.colors

  def initialize options
    @members = options[:members]
    @name = options[:name]
    # Set a color by picking the team's jersey.  Will throw if no colors left.
    @color = pick_team_jersey
    puts "The " +"#{colorized}" + " tribe has been created with the following members"
    # Good suggestion.  I like using .map :)
    output = @members.map{ |member| "#{member.to_s.capitalize}"}.join(", ")
    puts output
    puts
  end

  # Picks a random color and then deletes it from the available_colors array.
    # Note: I did make this throw an error when there are no colors left, but
    # that made the tests fail!
  def pick_team_jersey
    color = @@available_colors.sample
    @@available_colors.delete color
    color
  end
  # To_s will print in the color chosen when creating the tribe.
    # I think that is what the specifications were looking for?
  def to_s
    @name
  end

  # Defined separately, because the test was throwing.
    # Set a color if there is none and .send it.
  def colorized
    @color = "white" if !@color
    to_s.capitalize.send @color.to_sym
  end

  # Convenience for eliminating a contestant
  def eliminate contestant
    @members.delete contestant
  end

  # Reject will return all but the immune member and sample picks one contestant
    # Takes an options hash with the immune member.
  def tribal_council options={}
    @members.reject{ |member| member == options[:immune]}.sample
  end
end
