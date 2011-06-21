class AddCellOfficePhone < ActiveRecord::Migration
  def self.up
    add_column :users, :cell, :string
    add_column :users, :work, :string
  end

  def self.down
  end
end
