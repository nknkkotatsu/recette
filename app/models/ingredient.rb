class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :post_recipe

  with_options presence: true do
    validates :name
    validates :quantity
  end
end
