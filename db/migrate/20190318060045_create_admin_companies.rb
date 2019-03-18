class CreateAdminCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_companies do |t|
      t.string :name
      t.string :symbol
      t.string :type
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
