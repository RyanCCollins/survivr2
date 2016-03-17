require 'colorizr'

class Tribe
  attr_reader :name, :members

  def initialize options = {}
    @members = options[:members]
    @name = options[:name]
    puts "The #{@name} tribe has been created with the following members"
    output = ""
    @members.each{ |member| output += "-#{member}, "}
    puts output
  end

  def to_s
    @name
  end

  # Convenience for eliminating a contestant
  def eliminate contestant
    @members.delete contestant
  end

  def tribal_council immune=nil
    @members.reject { |member| member == immune }.sample
  end
end
