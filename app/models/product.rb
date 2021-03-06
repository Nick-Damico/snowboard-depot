class Product < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, :description, :image_url, :price, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :image_url, allow_blank: true,
                          format: { with: /\.(jpg|gif|png)\Z/i,
                                    message: 'must be a URL for a JPG, GIF or PNG image.' }
end