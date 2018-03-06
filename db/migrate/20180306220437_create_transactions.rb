class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.monetize :amount, null: false
      t.string :kind, null: false, default: ''
      t.string :comment
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
