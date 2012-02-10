class AddResultToTestTask < ActiveRecord::Migration
  def change
    change_table :test_tasks do |t|
      t.string :result, :default => "nil"
      TestTask.all.each {|task| task.update_attributes!(:result => "nil")}
    end
  end
end
