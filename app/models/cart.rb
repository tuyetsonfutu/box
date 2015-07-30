class Cart < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  belongs_to :user
  has_many :cart_product
end
