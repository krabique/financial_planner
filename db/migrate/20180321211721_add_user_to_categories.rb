class AddUserToCategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :user, index: true, null: false
  end
end
