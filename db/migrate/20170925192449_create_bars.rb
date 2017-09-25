class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.string :number
      t.string :hours
      t.string :photos
      t.string :website
      t.boolean :wifi
      t.boolean :games
      t.boolean :reservations
      t.string :happyhour

      t.timestamps
    end
  end
end
