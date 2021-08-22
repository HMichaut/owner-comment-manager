class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :replies
end
