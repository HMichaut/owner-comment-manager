class AddOpenToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :status, :boolean
  end
end
