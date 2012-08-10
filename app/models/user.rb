class User < ActiveRecord::Base
  attr_accessible :last_login, :password, :username
end
