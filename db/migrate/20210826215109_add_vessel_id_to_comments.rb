class AddVesselIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :vessel_id, :integer
  end
end
