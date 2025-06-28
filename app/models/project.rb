class Project < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
