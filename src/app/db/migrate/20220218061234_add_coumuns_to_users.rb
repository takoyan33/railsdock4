class AddCoumunsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :faculty, :string
  end
end
