class Idea < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, optional: true
  belongs_to :worker
  attribute :genre_id, :integer
  
  def get_idea_image(width, height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end
  
  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @idea = Idea.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @idea = Idea.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @idea = Idea.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @idea = Idea.where("name LIKE?","%#{word}%")
    else
      @idea = Idea.all
    end
  end
end
