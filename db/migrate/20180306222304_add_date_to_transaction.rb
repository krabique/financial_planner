class AddDateToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :date, :datetime, null: false,
      default: -> { 'CURRENT_TIMESTAMP' }
  end
end
