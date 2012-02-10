class CreateTestLinks < ActiveRecord::Migration
  def change
    create_table :test_links do |t|
      t.string :url
      t.references :test_task

      t.timestamps
    end
    add_index :test_links, :test_task_id
  end
end
