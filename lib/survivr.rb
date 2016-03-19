require 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "string_extension"

# Print a section header for the game
puts "Welcome to Survivr".to_header.background_green
#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)


#Phase one goes through 8 rounds
  # One contestant is loses the immunity challenge and votes off a member
  # Default options set suspense time as 1 so the tests don't fail.
  # This can be adjusted below.
def phase_one options = { suspense_time: 1 }
  puts "Phase One: Pre-merge Begins".to_header.background_green
  8.times do |round|
    losing_tribe = @borneo.immunity_challenge
    eliminated_contestant = losing_tribe.tribal_council
    losing_tribe.eliminate eliminated_contestant
    puts "#{losing_tribe.colorized} lost in the immunity challenge and must vote off a member"
    sleep(options[:suspense_time])
    puts "#{losing_tribe.colorized} has voted and #{eliminated_contestant.to_s.capitalize} has been eliminated"
    puts
    sleep(options[:suspense_time])
  end
end

# In phase two, there are three rounds.  The tribes merge to form one
  # big tribe. The immunity challenge picks one member who is immune from eliminations
  # The tribe then votes off one person.
def phase_two options = { suspense_time: 1 }
  puts "Phase Two: Merge Begins".to_header.background_green
  3.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s.capitalize} has won the individual immunity challenge"
    sleep(options[:suspense_time])
    eliminated_contestant = @merge_tribe.tribal_council immune: immune
    @merge_tribe.eliminate eliminated_contestant
    puts "#{@merge_tribe.colorized} has voted to elimate #{eliminated_contestant.to_s.capitalize}"
    puts
    sleep(options[:suspense_time])
  end
end

# In phase three, there are 7 rounds.  When a member is voted off, they are added to the jury.
def phase_three options = { suspense_time: 1 }
  puts "Phase Three: Jury Selection Begins".to_header.background_green
  7.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s.capitalize} has won the individual immunity challenge"
    sleep(options[:suspense_time])
    eliminated_contestant = @merge_tribe.tribal_council immune: immune
    @merge_tribe.eliminate eliminated_contestant
    @jury.add_member eliminated_contestant
    puts "#{@merge_tribe.colorized} has voted and #{eliminated_contestant.to_s.capitalize} is out of the game."
    puts "#{eliminated_contestant.to_s.capitalize} has been added to the jury"
    puts
    sleep(options[:suspense_time])
  end
end

# Set this in order to adjust the amount of delay between output.
  # The default is 1, 0 will sleep for 0 and any other positive number
  # will work great (including floats)!
default_options = { suspense_time: 1 } #💤💤💤💤

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================

phase_one default_options #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two default_options #3 more eliminations
@jury = Jury.new
phase_three default_options #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
