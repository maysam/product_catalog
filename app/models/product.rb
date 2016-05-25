class Product < ActiveRecord::Base
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  validates :name, uniqueness: true

  def price
    "#{amount.to_f/100} SGD" rescue 'Free'
  end

  def to_s
    name
  end
end
