class User < ActiveRecord::Base
  has_many :responses
  has_many :questions, :through => :responses
  has_many :surveys, :through => :questions
  
  has_secure_password
  
  attr_accessible :name, :email, :password, :password_confirmation, :admin
end
