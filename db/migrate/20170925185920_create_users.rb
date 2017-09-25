class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :profile_pic
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :username

      t.timestamps
    end
  end
end
