class AddUseridToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :user_id, :string
    #commentとの紐付け用のuser_id
  end
end