class AddArrayToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :counter, :string, array: true, default: []
  end
end
