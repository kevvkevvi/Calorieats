class CreateMarket < ActiveRecord::Migration
    def market
      create_table :market do |m|
        m.string :name
        m.string :category
        m.decimal :price
        m.integer :calories

        m.timestamps null: false
      end
    end
end