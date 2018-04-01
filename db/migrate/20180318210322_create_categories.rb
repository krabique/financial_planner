class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :categorizable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
