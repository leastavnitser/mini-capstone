class Product < ApplicationRecord
  validates :name, presence: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0.00 }

  validates :description, length: { minimum: 20 }, allow_blank: false
  validates :image_url, presence: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  belongs_to :supplier
  has_many :images

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
