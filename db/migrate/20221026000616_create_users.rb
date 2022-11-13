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
      t.number1 :number1
      t.number2 :number2
      t.number3 :number3
      t.number4 :number4
      t.number5 :number5
      t.number6 :number6
      t.number7 :number7

      t.timestamps null: false
    end
  end

end
