class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, :password_digest, :email_address

      t.timestamps
    end
  end
end
