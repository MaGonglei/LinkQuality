class TestTask < ActiveRecord::Base
  has_one :test_links, :dependent => :destroy, :validate => true
  has_one :test_setting, :dependent => :destroy ,:validate => true
  accepts_nested_attributes_for :test_links
end
