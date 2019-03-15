class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :admin, foreign_key: true
      t.string :name
      t.string :symbol
      t.string :type

      t.timestamps
    end
  end
end
