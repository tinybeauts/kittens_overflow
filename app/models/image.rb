class Image < ActiveRecord::Base
  attr_accessible :owner, :source_url
  has_many :stories
end
