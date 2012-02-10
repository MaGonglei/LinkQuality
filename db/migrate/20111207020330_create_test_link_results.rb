class CreateTestLinkResults < ActiveRecord::Migration
  def change
    create_table :test_link_result do |t|
      t.string :url
      t.integer :code
      t.string :title
      t.integer :depth
      t.string :referer
      t.string :content_type
      t.integer :response_time
      t.references :test_link

      t.timestamps
    end
  end
end
