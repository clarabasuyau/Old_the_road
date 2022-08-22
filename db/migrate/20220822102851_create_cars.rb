class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand_name
      t.string :city
      t.integer :seats

      t.timestamps
    end
  end
end
