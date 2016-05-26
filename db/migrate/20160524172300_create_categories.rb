class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :parent, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
