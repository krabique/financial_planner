class AddNameToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :name, :string, limit: 80
  end
end
