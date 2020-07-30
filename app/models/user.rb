class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#one to many relation between user and listings
  has_many :listings  
  has_one :address, dependent: :destroy 
  #nested attributes will allow to add different attributes of address table through user and update_only will allow to update all the attributes of address without providing id
  accepts_nested_attributes_for :address, update_only: :true
  has_one_attached :profile_pic
end
