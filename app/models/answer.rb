class Answer < ActiveRecord::Base
  belongs_to :responder, class_name: 'User'
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  validates :body, presence: true

  def set_favorited
    self.favorited = true
    self.save
  end
end
