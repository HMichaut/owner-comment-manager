class Project < ApplicationRecord
  has_many :project_relations
  has_many :users, through: :project_relations
  has_many :comments
  has_many :vessels
end
