class ForumThread < ApplicationRecord
  belongs_to :user
  has_many :forum_posts
  has_many :users, through: :forum_posts
end
