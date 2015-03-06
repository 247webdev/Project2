class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.email :email
      t.integer :zipcode
      t.password :password
      t.string :password_digest
      t.boolean :company

      t.timestamps null: false
    end
  end
end
