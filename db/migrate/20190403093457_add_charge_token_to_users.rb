class AddChargeTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :charge_token, :string
  end
end
