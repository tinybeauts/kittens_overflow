# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => [:votable_type, :votable_id] }

end
