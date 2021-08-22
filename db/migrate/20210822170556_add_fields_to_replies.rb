class AddFieldsToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :user_id, :integer
    add_column :replies, :project_id, :integer
    add_column :replies, :comment_id, :integer
  end
end
