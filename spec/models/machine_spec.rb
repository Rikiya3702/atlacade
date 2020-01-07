require 'rails_helper'

RSpec.describe Machine, type: :model do
  it "Factory(:machine)が有効である" do
    expect(FactoryBot.build(:machine)).to be_valid
  end

  it "titleがなければ無効である" do
    machine = FactoryBot.build(:machine, title: nil)
    machine.valid?
    expect(machine.errors[:title]).to include("を入力してください")
  end

  it "51文字のtitleは無効である" do
    machine = FactoryBot.build(:machine, title: "t" * 51)
    machine.valid?
    expect(machine.errors[:title]).to include("は50文字以内で入力してください")
  end

  it "50文字のtitleは有効である" do
    expect(FactoryBot.build(:machine, title: "t" * 50)).to be_valid
  end

  it "51文字のmakerは無効である" do
    machine = FactoryBot.build(:machine, maker: "t" * 51)
    machine.valid?
    expect(machine.errors[:maker]).to include("は50文字以内で入力してください")
  end

  it "50文字のmakerは有効である" do
    expect(FactoryBot.build(:machine, maker: "t" * 50)).to be_valid
  end

  it "51文字のgenreは無効である" do
    machine = FactoryBot.build(:machine, genre: "t" * 51)
    machine.valid?
    expect(machine.errors[:genre]).to include("は50文字以内で入力してください")
  end

  it "50文字のgenreは有効である" do
    expect(FactoryBot.build(:machine, genre: "t" * 50)).to be_valid
  end

  it "101文字のofficial_urlは無効である" do
    machine = FactoryBot.build(:machine, official_url: "t" * 101)
    machine.valid?
    expect(machine.errors[:official_url]).to include("は100文字以内で入力してください")
  end

  it "100文字のofficial_urlは有効である" do
    expect(FactoryBot.build(:machine, official_url: "t" * 100)).to be_valid
  end

  it "256文字のmachine_infoは無効である" do
    machine = FactoryBot.build(:machine, machine_info: "t" * 256)
    machine.valid?
    expect(machine.errors[:machine_info]).to include("は255文字以内で入力してください")
  end

  it "255文字のmachine_infoは有効である" do
    expect(FactoryBot.build(:machine, machine_info: "t" * 255)).to be_valid
  end
end
