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

  # Immunity challenge picks a random sample from @tribes.
  def immunity_challenge
    @tribes.sample
  end

  # Create a new tribe consisting of all members from all tribes
  def merge tribe_name
    merged_tribe = Tribe.new({ name: tribe_name, members: merged_members })
    merged_tribe
  end

  # Convenience method for creating combining the new members
  def merged_members
    new_members = []
    @tribes.each { |tribe| new_members << tribe.members }
    new_members.flatten!
  end

  # Clear the tribes array
  def clear_tribes
    @tribes.clear
  end

  # Return the contestant who is immune
  def individual_immunity_challenge
    merged_members.sample
  end

end
