class Munit < ApplicationRecord
  has_many :listings, dependent: :destroy  
end
