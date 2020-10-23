class Book < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true
    validates :body, length: { maximum: 200 }      # 「75文字以下」
end
