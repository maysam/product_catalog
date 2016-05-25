class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.references :product, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    
    add_index :product_categories, [:product_id, :category_id], unique: true
  end
end
