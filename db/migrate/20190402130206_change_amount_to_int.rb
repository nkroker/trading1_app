class ChangeAmountToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :investments, :amount, :integer
  end
end
