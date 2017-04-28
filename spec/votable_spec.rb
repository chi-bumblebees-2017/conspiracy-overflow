require 'spec_helper'

class VotableDummy
  include Votable
end


describe 'Votable' do
  let(:votable) { VotableDummy.new }

  describe "#total_vote_value" do
    it "Accurately gives the total vote value"

    it "Doesn't just give the vote count"
  end

  describe "#upvote_from" do
    it "Creates a vote with a value of 1"

    it "Connects the vote to the right user"
  end

  describe "#downvote_from" do
    it "Creates a vote with a value of -1"

    it "Connects the vote to the right user"
  end

  describe "#voted_on_by?" do
    it "returns true if the user has already voted on the votable"

    it "returns false if the user has not voted on that votable"
  end

end
