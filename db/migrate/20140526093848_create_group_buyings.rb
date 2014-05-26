class CreateGroupBuyings < ActiveRecord::Migration
  def change
    create_table :group_buyings do |t|
      t.integer :new_home_id
      t.integer :price
      t.text :explanation

      t.timestamps
    end
  end
end
