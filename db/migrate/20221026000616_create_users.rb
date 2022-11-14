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
      t.integer :number1
      t.integer :number2
      t.integer :number3
      t.integer :number4
      t.integer :number5
      t.integer :number6
      t.integer :number7

      t.timestamps null: false
    end
  end

end
