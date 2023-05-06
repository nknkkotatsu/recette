class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  
  #関連付けしたモデルを一緒にデータ保存できるようにする
  accepts_nested_attributes_for :procedures, allow_destroy: true
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  
  with_options presence: true do
    validates :name
    validates :introduction
    validates :ingredients
    validates :procedures
  end
end
