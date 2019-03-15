class CreateInvestmentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :investment_records do |t|
      t.references :admin, foreign_key: true
      t.references :investment, foreign_key: true
      t.float :invested_amount
      t.string :company_name
      t.string :company_symbol
      t.float :locked_price
      t.float :shares_quantity

      t.timestamps
    end
  end
end
