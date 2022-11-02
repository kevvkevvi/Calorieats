class CreateMarket < ActiveRecord::Migration
  def up
    create_table :markets do |m|
      m.string :name
      m.string :category
      m.decimal :price
      m.integer :calories

      m.timestamps null: false
    end
  end

  def down
    drop_table :markets
  end
end