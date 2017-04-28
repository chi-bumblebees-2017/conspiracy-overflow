module Votable
  def total_vote_value
    votes.inject(0) { |value, vote|  value + vote.value }
  end

  def upvote_from(user)
    unless voted_on_by?(user)
      votes << Vote.new(voter: user, value: 1)
    end
  end

  def downvote_from(user)
    unless voted_on_by?(user)
      votes << Vote.new(voter: user, value: -1)
    end
  end

  def voted_on_by?(user)
    votes.any? do |vote|
      vote.voter.id == user.id
    end
  end
end
