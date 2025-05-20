require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with all attributes" do
    user = User.new(nickname: "Taro", email: "test@example.com")
    expect(user).to be_valid
  end
end