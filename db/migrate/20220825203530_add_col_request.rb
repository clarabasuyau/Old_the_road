class AddColRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :request, :boolean, default: false
  end
end
