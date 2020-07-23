class AddMunitToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :munit, null: false, foreign_key: true
  end
end
