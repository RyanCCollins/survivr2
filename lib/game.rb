class Game
  attr_reader :tribes

  def initialize tribe_one, tribe_two
    @tribes = Array.new
    @tribes << tribe_one
    @tribes << tribe_two
  end

  def add_tribe tribe
    @tribes << tribe
  end
  def immunity_challenge
    @tribes.sample
  end
  def merge tribe_name
    new_members = []
    @tribes.each { |tribe| new_members << tribe.members }
    merged_tribe = Tribe.new({ name: tribe_name, members: new_members.flatten! })
    merged_tribe
  end
  def clear_tribes
    @tribes.clear
  end
  # Return the contestant who is immune
  def individual_immunity_challenge
    #code
  end

end
