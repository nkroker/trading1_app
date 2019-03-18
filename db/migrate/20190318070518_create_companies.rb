class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :symbol
      t.string :company_type

      t.timestamps
    end
  end
end
