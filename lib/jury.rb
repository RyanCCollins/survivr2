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
  def cast_votes finalists
    votes = Hash.new
    finalists.each do |finalist|
      votes[finalist] = 0
    end

    @members.each do |member|
      vote = finalists.sample
      puts "#{member} votes #{vote}"
      votes[vote] += 1
    end
    votes
  end
  def report_votes votes
    votes.each do |finalist, vote|
      puts "#{finalist} #{vote}"
    end
  end
  def announce_winner votes
    winner = votes.max_by { |fin, vote| vote }.first
    winner
  end
end
