class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :comment
  has_one_attached :image, dependent: :destroy
end
