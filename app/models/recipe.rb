class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  belongs_to :genre, optional: true
  belongs_to :worker
  
  def get_recipe_image(width, height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end
  
 accepts_nested_attributes_for :ingredients, :procedures, allow_destroy: true
  
  with_options presence: true do
    validates :name
    validates :explanation
    validates :ingredients
    validates :procedures
  end
end
