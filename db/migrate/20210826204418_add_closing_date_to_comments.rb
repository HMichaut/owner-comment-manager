class AddClosingDateToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :closing_date, :datetime
  end
end
