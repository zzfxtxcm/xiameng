class ChangeShoppingAndNeighborhoodsAndLandscapesAndBusAndCarInNewHomes < ActiveRecord::Migration
  def change
    change_column :new_homes, :shopping, :text
    change_column :new_homes, :neighborhoods, :text
    change_column :new_homes, :landscapes, :text
    change_column :new_homes, :bus, :text
    change_column :new_homes, :car, :text    
  end
end
