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
  has_many :liked_boards, through: :likes, source: :post

  def already_liked?(board)
    self.likes.exists?(board_id: board.id)
  end

  validates :name,
    presence: true,
    uniqueness: true,
    length: {maximum:16}
    # format: {
    #   with: /\A[a-z0-9]+\z/,
    #   message: 'は小文字英数字で入力してください'
    # }
  validates :password,
    length: {minimum: 8 }
  # def age
  #   now = Time.zone.now
  #   (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  # end
end
