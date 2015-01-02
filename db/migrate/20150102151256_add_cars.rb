class AddCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color, null: false
      t.integer :mileage, null: false
      t.integer :year, null: false
      t.integer :manufacturer_id, null: false
      t.text :description

      t.timestamps
    end
  end
end
