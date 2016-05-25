class Category < ActiveRecord::Base
  has_many :children, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, uniqueness: true

  scope :top_level, -> { where(parent: nil) }
  scope :sub_level, -> { top_level.map(&:children).flatten }
  scope :end_level, -> { sub_level.map(&:children).flatten }
  scope :parent_to_be, -> { top_level + sub_level }

  def to_s
    name
  end

  def is_parentable
    parent_id.nil? or parent.parent_id.nil?
  end
end
