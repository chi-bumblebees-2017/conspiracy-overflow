class Answer < ActiveRecord::Base
  include Votable
  belongs_to :responder, class_name: 'User'
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
end
