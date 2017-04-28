class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates_presence_of :title, :body, :author

  def clear_favorites
    answers.each do |answer|
      answer.favorited = false
      answer.save
    end
  end
end
