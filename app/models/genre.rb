class Genre < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :ideas, dependent: :destroy
  validates :name, presence: true
end
