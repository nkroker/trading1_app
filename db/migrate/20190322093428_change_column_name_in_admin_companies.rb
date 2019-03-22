class ChangeColumnNameInAdminCompanies < ActiveRecord::Migration[5.2]
  def change
    rename_column :admin_companies, :type, :company_type
  end
end
