class DropOpenFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :open, :boolean
  end
end
