class Address < ApplicationRecord
  # Address model relation with user
  belongs_to :user
end
