class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :ingredients, :directions
      t.string :title

      t.timestamps
    end
  end
end
