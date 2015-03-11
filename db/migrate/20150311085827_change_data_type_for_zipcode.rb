class ChangeDataTypeForZipcode < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :zipcode, :string, limit: 5
    end
  end
end