# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  source_url  :string(255)
#  owner       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  votes_count :integer          default(0), not null
#

class Image < ActiveRecord::Base
  attr_accessible :owner, :source_url
  has_many :stories
  has_many :votes, :as => :votable

  default_scope order('created_at DESC')
  scope :recent, limit(10)

  validates :source_url, presence: true
  validates :owner, presence: true

end
