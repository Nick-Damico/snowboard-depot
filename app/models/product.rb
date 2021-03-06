class Product < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, :description, :image_url, :price, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end