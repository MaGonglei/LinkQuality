class Task < ActiveRecord::Base
  has_one :link_test, :dependent => :destroy, :validate => true
  has_one :setting, :dependent => :destroy ,:validate => true
  accepts_nested_attributes_for :link_test
end
