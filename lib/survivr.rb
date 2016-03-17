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


#This is where you will write your code for the three phases
def phase_one
  eliminated_contestants = []
  puts "Phase One: Pre-merge Begins".to_header.background_green
  8.times do |round|
    losing_tribe = @borneo.immunity_challenge
    eliminated_contestant = losing_tribe.tribal_council
    losing_tribe.eliminate eliminated_contestant
    eliminated_contestants << eliminated_contestant
    puts "#{losing_tribe.to_s} lost in the immunity challenge".red
    sleep(1)
    puts "#{losing_tribe.to_s} has voted and #{eliminated_contestant.to_s} has been eliminated".red
    puts
    sleep(1)
  end
  eliminated_contestants.length
end

def phase_two
  puts "Phase Two: Merge Begins".to_header.background_green
  eliminated_contestants = []
  3.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s} has won the individual immunity challenge"
    sleep(1)
    eliminated_contestant = @merge_tribe.tribal_council immune
    eliminated_contestants << eliminated_contestant
    @merge_tribe.eliminate eliminated_contestant
    puts "#{@merge_tribe.to_s} has voted to elimate #{eliminated_contestant.to_s}"
    puts
    sleep(1)
  end
  puts
  eliminated_contestants.length
end


def phase_three
  puts "Phase Three: Jury Selection Begins".to_header
  7.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s} has won the individual immunity challenge"
    sleep(1)
    eliminated_contestant = @merge_tribe.tribal_council immune
    @merge_tribe.eliminate eliminated_contestant
    @jury.add_member eliminated_contestant
    puts "#{@merge_tribe} has voted and #{eliminated_contestant.to_s} is out of the game."
    puts "#{eliminated_contestant.to_s} has been added to the jury"
    puts
    sleep(1)
  end
  @jury.members.length
end



# If all the tests pass, the code below should run the entire simulation!!
#=========================================================

phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
