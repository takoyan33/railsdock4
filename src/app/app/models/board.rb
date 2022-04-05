# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null#
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :board_tag_relations, dependent: :delete_all
  has_many :tags, through: :board_tag_relations
  has_one_attached :image
  belongs_to :user , optional: true

  validates :name, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_last_month, -> { where(created_at: Time.zone.now.prev_month.all_day) } # １ヶ月前の投稿
  scope :created_month, -> { where(created_at: Time.zone.now.all_month) } # 今月の投稿
end
