# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
  has_many :stories
    
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
