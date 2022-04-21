class Like < ApplicationRecord
  belongs_to :boards
  belongs_to :users
  validates_uniqueness_of :board_id, scope: :user_id
end
