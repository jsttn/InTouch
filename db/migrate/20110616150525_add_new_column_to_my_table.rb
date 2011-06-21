class AddNewColumnToMyTable < ActiveRecord::Migration
  def self.up
    add_column :users, :phonenumber, :string
  end

  def self.down
  end
end
