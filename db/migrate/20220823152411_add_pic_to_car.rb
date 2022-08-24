class AddPicToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :picture, :string
  end
end
