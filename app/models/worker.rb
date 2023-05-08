class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |worker|
      worker.password = SecureRandom.urlsafe_base64
      worker.name = "guestuser"
    end
  end
end
