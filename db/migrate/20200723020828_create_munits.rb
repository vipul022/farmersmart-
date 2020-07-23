class CreateMunits < ActiveRecord::Migration[6.0]
  def change
    create_table :munits do |t|
      t.string :name

      t.timestamps
    end
  end
end
