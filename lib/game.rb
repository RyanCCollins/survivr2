class Game
  attr_reader :tribes
  # Initialize the tribes array
  def initialize *tribes #SPLAT! 🙈
    @tribes = tribes
  end

  # Push a new tribe onto the @tribes array
  def add_tribe tribe
    @tribes << tribe
  end

  # Immunity challenge picks a random sample from @tribes.
  def immunity_challenge
    @tribes.sample
  end

  # Create a new tribe consisting of all members from all tribes
    # and then add this new tribe to the @tribes array
  def merge tribe_name
    new_tribe = Tribe.new({ name: tribe_name, members: merged_members })
    @tribes.clear # Clear the tribes array
    add_tribe new_tribe # Add our new tribe
    @tribes[0] # has to return a tribe, not array, so select index 0
  end

  # Convenience method for creating / combining the new members
  def merged_members
    new_members = []
    @tribes.each { |tribe| new_members << tribe.members }
    new_members.flatten!
  end

  # Clear the tribes array
  def clear_tribes
    @tribes.clear
  end

  # Return the contestant who is immune.
  def individual_immunity_challenge
    merged_members.sample
  end

end
