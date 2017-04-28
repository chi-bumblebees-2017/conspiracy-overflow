class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: 'User'

  validates_presence_of :votable_id, :voter_id, :value

  validate :value_acceptable

  private

  def value_acceptable
    unless  value == 1 || value == -1
      value.errors.add(:value, "must be 1 or -1")
    end
  end
end
