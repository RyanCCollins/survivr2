require_relative "string_extension"
require "colorizr"

class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member member
    @members << member
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
      output = "#{finalist.to_s.capitalize} has #{vote} vote"
      output += "s" if vote > 1
      puts output
    end
  end

  def announce_winner votes
    winner = votes.max_by { |_, vote| vote }.first
    puts "And the winner of Survivr is...".to_header.background_green
    sleep(1)
    puts "Wait for it"
    sleep(2)
    puts "#{winner.name.upcase} WINS!!!!!! "
    winner
  end
end
