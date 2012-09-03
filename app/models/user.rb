class User < ActiveRecord::Base
  attr_accessible :password, :username, :name
  validates_presence_of :password, :username, :name
end
