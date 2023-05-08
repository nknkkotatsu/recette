class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  belongs_to :genre
  
 accepts_nested_attributes_for :ingredients, :procedures, allow_destroy: true
  
  with_options presence: true do
    validates :name
    validates :introduction
    validates :ingredients
    validates :procedures
  end
end
