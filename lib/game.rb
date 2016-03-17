class Game
  attr_reader :tribes

  def initialize tribe_one, tribe_two
    @tribes = Array.new
    @tribes << tribe_one
    @tribes << tribe_two
  end

  # Push a new tribe onto the @trives array
  def add_tribe tribe
    @tribes << tribe
  end

  # Get a random sample from the tribes
  def immunity_challenge
    @tribes.sample
  end

  # Create a new tribe consisting of all members from all tribes
  def merge tribe_name
    new_members = []
    @tribes.each { |tribe| new_members << tribe.members }
    merged_tribe = Tribe.new({ name: tribe_name, members: new_members.flatten! })
    merged_tribe
  end

  # Clear the tribes array
  def clear_tribes
    @tribes.clear
  end

  # Return the contestant who is immune
  def individual_immunity_challenge
    all_members = []
    @tribes.each{ |tribe| all_members << tribe.members }
    all_members.flatten.sample
  end

end
