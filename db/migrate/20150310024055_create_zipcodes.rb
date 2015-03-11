class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :zipcode, limit: 5
      t.column :latitude,   :decimal, precision: 10, scale: 6
      t.column :longitude,  :decimal, precision: 10, scale: 6
    end
  end
end