class Image < ActiveRecord::Base
  attr_accessible :owner, :source_url
  has_many :stories
  has_many :votes, :as => :votable

  default_scope order('created_at DESC')
  scope :recent, limit(10)
end
