# require 'spec_helper'

# describe "Vote" do
#   describe "validations" do
#     # allow(Vote).to_receive(:all).and_return(ActiveRecord::Collection.new(
#     #   ))
#     let(:vote) { Vote.new(voter: User.all.sample, votable: Question.all.sample) }
#     it "ensures 1 and -1 are acceptable values" do
#       vote.value = 1
#       expect(vote).to be_valid
#       vote.value = -1
#       expect(vote).to be_valid
#     end

#     it "ensures all other values are unacceptable" do
#       vote.value = 0
#       expect(vote).to be_invalid
#       vote.value = 2
#       expect(vote).to be_invalid
#       vote.value = -2
#       expect(vote).to be_invalid
#     end
#   end
# end
