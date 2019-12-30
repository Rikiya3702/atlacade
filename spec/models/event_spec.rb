require 'rails_helper'

RSpec.describe Event, type: :model do

  it "Factory(:event)が有効である" do
    expect(FactoryBot.build(:event)).to be_valid
  end

  it "256文字のcontentは無効である" do
    event = FactoryBot.build(:event, content: "t" * 256)
    event.valid?
    expect(event.errors[:content]).to include("は255文字以内で入力してください")
  end

end
