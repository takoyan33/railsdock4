# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  # (1..5).each do |i|
  #   Board.create(name: "ユーザー#{i}", title: "タイトル#{i}", body: "本文#{i}")
  # end

  Tag.create!([
  { name: '講義'},
  { name: 'サークル'},
  { name: '大学生活'},
  { name: 'バイト'},
  { name: 'イベント'},
  { name: 'その他'},  
  ])
end


if Rails.env == 'production'

  Tag.create!([
  { name: '講義'},
  { name: 'サークル'},
  { name: '大学生活'},
  { name: 'バイト'},
  { name: 'イベント'},
  { name: 'その他'},  
  ])
end