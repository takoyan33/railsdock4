class AddUseridToBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :user_id, :string
    #boardとの紐付け用のuser_id
  end
end
