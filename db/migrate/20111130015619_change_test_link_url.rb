class ChangeTestLinkUrl < ActiveRecord::Migration
  def up
    change_column :test_links,:url,:text,:limit => 100000
  end

  def down
    change_column :test_links, :url,:text
  end
end
