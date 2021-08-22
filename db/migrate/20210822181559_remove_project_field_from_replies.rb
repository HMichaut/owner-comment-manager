class RemoveProjectFieldFromReplies < ActiveRecord::Migration[6.1]
  def change
    remove_column :replies, :project_id
  end
end
