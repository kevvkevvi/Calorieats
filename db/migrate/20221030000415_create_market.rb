class CreateMarket < ActiveRecord::Migration
  def upp
    create_table :markets do |m|
      m.string :name
      m.string :category
      m.decimal :price
      m.integer :calories
      m.integer :number

      m.timestamps null: false
    end
  end

  def dow
    drop_table :markets
  end
end