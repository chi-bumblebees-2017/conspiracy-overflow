module Votable
  def total_vote_value
    votes.inject(0) { |value, vote|  value + vote.value }
  end

  def upvote_from(user)
    if ( vote = vote_by(user) )
      Vote.destroy(vote.id) if vote.value == -1
    end
    create_vote(user, 1) unless vote_by(user)
  end

  def downvote_from(user)
    if ( vote = vote_by(user) )
      Vote.destroy(vote.id) if vote.value == 1
    end
    create_vote(user, -1) unless vote_by(user)

  end

  def vote_by(user)
    old_vote = votes.find do |vote|
      vote.voter.id == user.try(:id)
    end
  end

  def vote_match(direction, user)
    if direction == "up"
      vote_by(user).try(:value) == 1
    else
      vote_by(user).try(:value) == -1
    end
  end

  # private
  def create_vote(user, value)
    new_vote = Vote.new(voter: user, value: value)
    votes << new_vote
    new_vote
  end

end

