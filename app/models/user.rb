class User < ApplicationRecord
  has_many :project_relations
  has_many :comments
  has_many :replies
  has_many :projects, through: :project_relations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
