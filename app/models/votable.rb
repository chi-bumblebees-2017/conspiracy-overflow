module Votable
  def total_vote_value
    votes.inject(0) { |value, vote|  value + vote.value }
  end

  def upvote_from(user)
    destroy_vote_if_value(user, -1)
    create_vote(user, 1) unless vote_by(user)
  end

  def downvote_from(user)
    destroy_vote_if_value(user, 1)
    create_vote(user, -1) unless vote_by(user)
  end

  def vote_by(user)
    votes.find do |vote|
      vote.voter.id == user.try(:id)
    end
  end

  def vote_match(direction, user)
    value_to_check = (direction == "up" ) ? 1 : -1
    vote_by(user).try(:value) == value_to_check
  end

  private

  def destroy_vote_if_value(user, value)
    if ( vote = vote_by(user) )
      if vote.value == value
        Vote.destroy(vote.id)
        # this refreshes the object's associations so that the destroy updates its votes collection
        reload
      end
    end
  end

  def create_vote(user, value)
    new_vote = Vote.new(voter: user, value: value)
    votes << new_vote
    new_vote
  end

end

