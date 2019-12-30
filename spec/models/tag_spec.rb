require 'rails_helper'

RSpec.describe Tag, type: :model do

  it "Factory(:tag)が有効である" do
    expect(FactoryBot.build(:tag)).to be_valid
  end

  it "smokingのデフォルト値は0である" do
    tag = FactoryBot.build(:tag)
    tag.valid?
    expect(tag.smoking).to eq 0
  end
end
