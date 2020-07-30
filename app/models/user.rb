class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#one to many relation between user and listings and dependent: :destroy has been used to destroy all the listings of a user if user is destroyed so that it does not leave an orphaned record in database
  has_many :listings, dependent: :destroy  
  has_one :address, dependent: :destroy 
  #nested attributes will allow to add different attributes of address table through user and update_only will allow to update all the attributes of address without providing id
  accepts_nested_attributes_for :address, update_only: :true
  #set up active record for attaching the image
  has_one_attached :profile_pic
  #one to one relation between user and cart model
  has_one :cart, dependent: :destroy
end
