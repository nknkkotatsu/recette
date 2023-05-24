class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :points, dependent: :destroy
  # ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |worker|
      worker.password = SecureRandom.urlsafe_base64
      worker.name = "guestuser"
    end
  end
  def active_for_authentication?
    super && !is_deleted
  end
end
