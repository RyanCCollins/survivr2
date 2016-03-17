class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member name
    @members << name
  end

  def members
    @members
  end

  # The jury Casts votes for finalists.
  def cast_votes finalists
    votes = Hash.new
    finalists.each do |finalist|
      votes[finalist] = 0
    end

    members.each do |member|
      vote = finalists.sample
      puts "#{member.to_s.capitalize} votes for #{vote.to_s.capitalize}"
      votes[vote] += 1
    end
    votes
  end

  def report_votes votes
    votes.each do |finalist, vote|
      puts "#{finalist.to_s.capitalize} has #{vote} votes"
    end
  end

  def announce_winner votes
    winner = votes.max_by { |_, vote| vote }.first
    puts "*" * 80
    puts "And the winner of Survivr is...".center(80)
    puts "*" * 80
    sleep(1)
    puts "Wait for it"
    sleep(2)
    puts "#{winner.name.upcase} WINS!!!!!! "
    winner
  end
end
