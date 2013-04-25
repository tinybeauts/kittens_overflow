class Story < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  belongs_to :image
  default_scope order('created_at DESC')
  scope :recent, limit(10)
end
