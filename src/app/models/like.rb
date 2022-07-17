class Like < ApplicationRecord
  #中間テーブル
  belongs_to :board
  belongs_to :user
  validates_uniqueness_of :board_id, scope: :user_id
  #userは1つの投稿に対して１いいねのみ付けれるバリデーション
end
