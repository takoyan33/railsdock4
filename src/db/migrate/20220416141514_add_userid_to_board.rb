class AddUseridToBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :user_id, :string
  end
end
