class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #, :authentication_keys => [:login]

  has_many :wallets, dependent: :destroy
  has_many :cards, :through => :wallets

  has_many :discount_ratings, dependent: :destroy
  has_many :discounts, :through => :discount_ratings

  has_many :store_info_ratings, dependent: :destroy
  has_many :store_infos, :through => :store_info_ratings

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
