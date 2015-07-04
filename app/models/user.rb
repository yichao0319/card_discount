class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #, :authentication_keys => [:login]

  # Virtual attribute for authenticating by either account or email
  # This is in addition to a real persisted field like 'account'
  # attr_accessor :login
  # def login=(login)
  #   @login = login
  # end

  # def login
  #   @login || self.account || self.email
  # end
end
