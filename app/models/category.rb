class Category < ActiveRecord::Base
  has_many :children, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, uniqueness: true

  scope :top_level, -> { where parent: nil }
  scope :sub_level, -> { top_level.map(&:children).flatten }
  scope :end_level, -> { sub_level.map(&:children).flatten }
  scope :parent_to_be, -> { top_level + sub_level }

  scope :with_product, -> do
    categories = Category.where id: ProductCategory.pluck(:category_id)
    categories_1 = categories.map(&:parent).compact
    categories_2 = categories_1.map(&:parent).compact
    (categories + categories_1 + categories_2).uniq
  end

  def all_product_ids
    if children.empty?
      product_ids
    else
      product_ids + children.map { |e| e.all_product_ids }
    end
  end

  def to_s
    name
  end
end
