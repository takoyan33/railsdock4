require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前を登録すると名前が取得できること" do
  user = User.new(
          name:  "太郎",
          password: "abcdefg"
  )
  expect(user.name).to eq "太郎"
  end
end
