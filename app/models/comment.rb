class Comment < ActiveRecord::Base
  include Votable
  has_many :votes, as: :votable
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User'

  validates_presence_of :commenter_id, :commentable_id, :commentable_type, :body
end
