class AddCompanyToLaptops < ActiveRecord::Migration[5.2]
  def change
    add_column :laptops, :company, :string
  end
end
