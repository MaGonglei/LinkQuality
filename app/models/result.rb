class Result < ActiveRecord::Base

  validates :url,  :presence => true

  belongs_to :task

end


