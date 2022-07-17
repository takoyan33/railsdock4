# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  birthday        :date
#  faculty         :string(255)
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  profile         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_boards, through: :likes, source: :board
  #userがどの投稿をいいねしているのかを簡単に取得
  mount_uploader :image, ImageUploader

  def already_liked?(board)
    self.likes.exists?(board_id: board.id)
  end
  #すでにいいねをしているのかどうかを判定

  validates :name,
    presence: true,
    uniqueness: true,
    length: {maximum:16}
  validates :password,
    length: {minimum: 8 }
end
