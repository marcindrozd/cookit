class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.integer :category_id, :recipe_id

      t.timestamps
    end
  end
end