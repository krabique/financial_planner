class AddOriginToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :origin, null: true, default: nil
    add_foreign_key :transactions, :categories, column: :origin_id,
      primary_key: :id
  end
end
