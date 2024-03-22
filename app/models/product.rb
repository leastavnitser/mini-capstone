class Product < ApplicationRecord
  validates :name, presence: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0.00 }

  validates :description, length: { minimum: 20 }, allow_blank: false
  validates :image_url, presence: true

  belongs_to :supplier
  has_many :images
  has_many :orders

  def is_discounted?
    price <= 10
  end

  def tax
    tax = price * 0.09
  end

  def total
    price + tax
  end
end
