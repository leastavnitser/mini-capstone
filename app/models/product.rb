class Product < ApplicationRecord
  validates :name, presence: true
  
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0.00}
  
  validates :description, length: {minimum: 20}, allow_blank: false
  validates :image_url, presence: true
  # validate :image_url_format


  # def image_url_format
  #   uri = URI.parse(image_url) rescue false
  #   errors.add(:image_url, "is invalid") unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  # end

  # def valid_image_extension
  #   allowed_extensions = /\.(jpg|jpeg|png|gif)\Z/i  
  #   unless image_url_match(allowed_extensions)
  #      errors.add(:image_url, "must be a URL ending in JPG, JPEG, PNG, or GIF")  
  # end

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
