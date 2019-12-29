class AddValueToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :value, :integer
  end
end
