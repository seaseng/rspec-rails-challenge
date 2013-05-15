class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password
  validates :email, :password, :presence => true
  validates :email, :uniqueness => true
end
