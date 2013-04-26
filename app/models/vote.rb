class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => [:votable_type, :votable_id] }

end
