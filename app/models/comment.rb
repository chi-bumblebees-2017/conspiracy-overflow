class Comment < ActiveRecord::Base
  include Votable
  has_many :votes, as: :votable
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User'
end
