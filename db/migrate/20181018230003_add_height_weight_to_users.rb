class AddHeightWeightToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
  end
end
