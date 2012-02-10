class CreateTestTasks < ActiveRecord::Migration
  def change
    create_table :test_tasks do |t|
      t.string :person
      t.datetime :checktime

      t.timestamps
    end
  end
end
