class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :type_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
