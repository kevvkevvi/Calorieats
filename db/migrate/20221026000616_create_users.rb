class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.decimal :height
      t.decimal :weight
      t.integer :age
      t.string :gender
      t.string :sports_level

      t.timestamps null: false
    end
  end

end
