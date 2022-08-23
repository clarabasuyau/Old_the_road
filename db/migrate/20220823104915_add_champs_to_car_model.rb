class AddChampsToCarModel < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :price, :integer
    add_column :cars, :model, :string
    add_column :cars, :overview, :text
  end
end
