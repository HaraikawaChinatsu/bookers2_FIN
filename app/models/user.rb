class User < ApplicationRecord
  # # attachment :image
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy

  validates :name, length: { minimum: 2 }       # 「1文字以上」
  validates :name, length: { maximum: 20 }      # 「75文字以下」
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }

end
