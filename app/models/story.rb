# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  image_id    :integer          not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  votes_count :integer          default(0), not null
#

class Story < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  belongs_to :image
  has_many :votes, :as => :votable

  default_scope order('created_at DESC')
  scope :recent, limit(10)
end
