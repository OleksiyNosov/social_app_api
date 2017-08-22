class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lat, :float
    add_column :users, :lng, :float
    add_column :users, :birthday, :datetime
  end
end
