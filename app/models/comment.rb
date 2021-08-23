class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :replies, dependent: :delete_all
  has_one_attached :image, dependent: :destroy
end