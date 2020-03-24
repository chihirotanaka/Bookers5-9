class Book < ApplicationRecord
	attachment :profile_image

	validates :title, presence: true
    validates :body, presence: true
    validates :body, length: { maximum: 200 }

    belongs_to :user
end
