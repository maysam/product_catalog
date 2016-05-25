class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category

  validates :product, uniqueness: { scope: :category,
    message: "should be in a category only once" }
end
