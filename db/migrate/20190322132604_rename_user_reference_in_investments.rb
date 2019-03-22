class RenameUserReferenceInInvestments < ActiveRecord::Migration[5.2]
  def change
    rename_column :investments, :user_id, :customer_id
  end
end
