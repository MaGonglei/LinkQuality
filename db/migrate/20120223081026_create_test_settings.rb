class CreateTestSettings < ActiveRecord::Migration
  def change
    create_table :test_settings do |t|
      t.integer :threads,:default => 1
      t.integer :depth_limit,:default => 0
      t.boolean :subdomains, :default => true
      t.references :test_task

      t.timestamps
    end
    add_index :test_settings, :test_task_id
  end
end
