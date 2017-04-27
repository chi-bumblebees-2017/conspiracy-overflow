class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :responder_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id
end
