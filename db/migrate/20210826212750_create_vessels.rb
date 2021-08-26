class CreateVessels < ActiveRecord::Migration[6.1]
  def change
    create_table :vessels do |t|
      t.integer :project_id
      t.string :hull_number

      t.timestamps
    end
  end
end
