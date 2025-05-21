class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :postal_code
      t.integer :area_id
      t.string :city
      t.string :street
      t.string :building
      t.string :phone_number

      t.timestamps
    end
  end
end
