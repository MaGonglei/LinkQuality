class TestLinkResult < ActiveRecord::Base
  validates :url,  :presence => true
  belongs_to :test_links
end
