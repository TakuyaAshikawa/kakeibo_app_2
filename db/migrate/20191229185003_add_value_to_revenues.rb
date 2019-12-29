class AddValueToRevenues < ActiveRecord::Migration[5.1]
  def change
    add_column :revenues, :value, :integer
  end
end
