class CreateMarket < ActiveRecord::Migration
    def market
      create_table :markets do |m|
        m.string :name
        m.string :category
        m.decimal :price
        m.integer :calories

        m.timestamps null: false
      end
    end
end