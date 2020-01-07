require 'rails_helper'

RSpec.describe User, type: :model do

  it "Factory(:user)が有効である" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "nicknameがなければ無効である" do
    user = FactoryBot.build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  it "51文字のnicknameは無効である" do
    user = FactoryBot.build(:user, nickname: "t" * 51)
    user.valid?
    expect(user.errors[:nickname]).to include("は50文字以内で入力してください")
  end

  it "50文字のnicknameは有効である" do
    expect(FactoryBot.build(:user, nickname: "t" * 50)).to be_valid
  end

  it "emailがなければ無効である" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "51文字のemailは無効である" do
    user = FactoryBot.build(:user, email: "t" * 42 + "@test.com")
    user.valid?
    expect(user.errors[:email]).to include("は50文字以内で入力してください")
  end

  it "@のないemailは無効である" do
    user = FactoryBot.build(:user, email: "t" * 10)
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end

  it "50文字のemailは有効である" do
    expect(FactoryBot.build(:user, email: "t" * 41 + "@test.com")).to be_valid
  end

  it "重複したemailは無効である" do
    FactoryBot.create(      :user, email: "test@test.com")
    user = FactoryBot.build(:user, email: "test@test.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "passwordがなければ無効である" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "5文字のpasswordは無効である" do
    user = FactoryBot.build(:user, password: "t" * 5)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "6文字のpasswordは有効である" do
    expect(FactoryBot.build(:user, password: "t" * 6)).to be_valid
  end

  it "129文字のpasswordは無効である" do
    user = FactoryBot.build(:user, password: "t" * 129)
    user.valid?
    expect(user.errors[:password]).to include("は128文字以内で入力してください")
  end

  it "128文字のpasswordは有効である" do
    expect(FactoryBot.build(:user, password: "t" * 128)).to be_valid
  end

  it "roleのデフォルト値は0である" do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.role).to eq 0
  end

end
