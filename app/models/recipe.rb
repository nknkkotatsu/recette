class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :points, dependent: :destroy
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

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @recipe = Recipe.where("name LIKE?", "#{word}")
    elsif search == "forward_match"

      if word.start_with?("あ")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "あ%", "い%", "う%", "え%", "お%", "ア%", "イ%", "ウ%", "エ%", "オ%",)
      elsif word.start_with?("か")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?
                                OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "か%", "き%", "く%", "け%", "こ%", "カ%", "キ%", "ク%", "ケ%", "コ%",
                                "が%", "ぎ%", "ぐ%", "げ%", "ご%", "ガ%", "ギ%", "グ%", "ゲ%", "ゴ%",)
      elsif word.start_with?("さ")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?
                                OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "さ%","し%", "す%", "せ%", "そ%", "ざ%", "じ%", "ず%", "ぜ%", "ぞ%",
                                "サ%", "シ%", "ス%", "セ%", "ソ%", "ザ%", "ジ%", "ズ%", "ゼ%", "ゾ%",)
      elsif word.start_with?("た")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?
                                 OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "た%", "ち%", "つ%", "て%", "と%", "タ%", "チ%", "ツ%", "テ%", "ト%",
                                "だ%", "ぢ%", "づ%", "で%", "ど%", "ダ%", "ヂ%", "ヅ%", "デ%", "ド%",)
      elsif word.start_with?("な")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?  OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "な%", "に%", "ぬ%", "ね%", "の%", "ナ%", "ニ%", "ヌ%", "ネ%", "ノ%",)
      elsif word.start_with?("は")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?  OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?
                                OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? 
                                OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "は%", "ひ%", "ふ%", "へ%", "ほ%", "ハ%", "ヒ%", "フ%", "ヘ%", "ホ%",
                                "ば%", "び%", "ぶ%", "べ%", "ぼ%", "バ%", "ビ%", "ブ%", "ベ%", "ボ%",
                                "ぱ%", "ぴ%", "ぷ%", "ぺ%", "ぽ%", "パ%", "ピ%", "プ%", "ペ%", "ポ%",)
      elsif word.start_with?("ま")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?  OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "ま%", "み%", "む%", "め%", "も%", "マ%", "ミ%", "ム%", "メ%", "モ%",)
      elsif word.start_with?("や")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "や%", "ゆ%", "よ%", "ヤ", "ユ", "ヨ", )
      elsif word.start_with?("ら")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? ",
                                "ら%", "り%", "る%", "れ%", "ろ%", "ラ%", "リ%", "ル%", "レ%", "ロ%",)
      elsif word.start_with?("わ")
        @recipe = Recipe.where("name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?",
                                "わ%", "を%", "ん%","ワ%", "ヲ%", "ン%", )
      end

#      @recipe = Recipe.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @recipe = Recipe.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @recipe = Recipe.where("name LIKE?","%#{word}%")
    else
      @recipe = Recipe.all
    end
  end
end
