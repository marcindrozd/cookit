class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, :recipe_id

      t.timestamps
    end
  end
end
