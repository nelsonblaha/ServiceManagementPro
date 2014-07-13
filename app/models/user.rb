class User < ActiveRecord::Base
  has_many :tickets
  has_many :tasks
  has_many :notes
  has_secure_password
  validates_presence_of :password, on: :create
end
