class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
  has_many :stories
  has_many :users
  
  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
                    format: { with: email_regex },
                    uniqueness: true

  validates :username, presence: true,
                       uniqueness: true

  def has_voted_on?(obj)
    Vote.find_by_user_id_and_votable_type_and_votable_id(self.id, obj.class.to_s, obj.id)
  end

end
