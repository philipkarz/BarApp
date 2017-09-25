class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.belongs_to :user, foreign_key: true
      t.belongs_to :bar, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
