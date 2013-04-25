class Image < ActiveRecord::Base
  attr_accessible :owner, :source_url
  has_many :stories
  has_many :votes, :as => :votable
end
