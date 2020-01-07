require 'rails_helper'

RSpec.describe Shop, type: :model do

  it "Factory(:shop)が有効である" do
    expect(FactoryBot.build(:shop)).to be_valid
  end

  it "Factory(:shop, :with_events)はイベントを3つ持つ" do
    shop = FactoryBot.create(:shop, :with_events)
    expect(shop.event.count).to eq 3
  end

  it "shop_nameがなければ無効である" do
    shop = FactoryBot.build(:shop, shop_name: nil)
    shop.valid?
    expect(shop.errors[:shop_name]).to include("を入力してください")
  end

  it "51文字のshop_nameは無効である" do
    shop = FactoryBot.build(:shop, shop_name: "t" * 51)
    shop.valid?
    expect(shop.errors[:shop_name]).to include("は50文字以内で入力してください")
  end

  it "50文字のshop_nameは有効である" do
    expect(FactoryBot.build(:shop, shop_name: "t" * 50)).to be_valid
  end

  it "telがなければ無効である" do
    shop = FactoryBot.build(:shop, tel: nil)
    shop.valid?
    expect(shop.errors[:tel]).to include("を入力してください")
  end

  it "21文字のtelは無効である" do
    shop = FactoryBot.build(:shop, tel: "t" * 21)
    shop.valid?
    expect(shop.errors[:tel]).to include("は20文字以内で入力してください")
  end

  it "20文字のtelは有効である" do
    expect(FactoryBot.build(:shop, tel: "t" * 20)).to be_valid
  end

  it "重複したtelは無効である" do
    FactoryBot.create(      :shop, tel: "111-1111-1111")
    shop = FactoryBot.build(:shop, tel: "111-1111-1111")
    shop.valid?
    expect(shop.errors[:tel]).to include("はすでに存在します")
  end

  it "51文字のadressは無効である" do
    shop = FactoryBot.build(:shop, adress: "t" * 51)
    shop.valid?
    expect(shop.errors[:adress]).to include("は50文字以内で入力してください")
  end

  it "50文字のadressは有効である" do
    expect(FactoryBot.build(:shop, adress: "t" * 50)).to be_valid
  end

  it "51文字のaccessは無効である" do
    shop = FactoryBot.build(:shop, access: "t" * 51)
    shop.valid?
    expect(shop.errors[:access]).to include("は50文字以内で入力してください")
  end

  it "50文字のaccessは有効である" do
    expect(FactoryBot.build(:shop, access: "t" * 50)).to be_valid
  end

  it "51文字のbusiness_hoursは無効である" do
    shop = FactoryBot.build(:shop, business_hours: "t" * 51)
    shop.valid?
    expect(shop.errors[:business_hours]).to include("は50文字以内で入力してください")
  end

  it "50文字のbusiness_hoursは有効である" do
    expect(FactoryBot.build(:shop, business_hours: "t" * 50)).to be_valid
  end

  it "51文字のnearest_stationは無効である" do
    shop = FactoryBot.build(:shop, nearest_station: "t" * 51)
    shop.valid?
    expect(shop.errors[:nearest_station]).to include("は50文字以内で入力してください")
  end

  it "50文字のnearest_stationは有効である" do
    expect(FactoryBot.build(:shop, nearest_station: "t" * 50)).to be_valid
  end

  it "256文字のshop_infoは無効である" do
    shop = FactoryBot.build(:shop, shop_info: "t" * 256)
    shop.valid?
    expect(shop.errors[:shop_info]).to include("は255文字以内で入力してください")
  end

  it "255文字のshop_infoは有効である" do
    expect(FactoryBot.build(:shop, shop_info: "t" * 255)).to be_valid
  end

  it "101文字のofficial_urlは無効である" do
    shop = FactoryBot.build(:shop, official_url: "t" * 101)
    shop.valid?
    expect(shop.errors[:official_url]).to include("は100文字以内で入力してください")
  end

  it "100文字のofficial_urlは有効である" do
    expect(FactoryBot.build(:shop, official_url: "t" * 100)).to be_valid
  end
end
