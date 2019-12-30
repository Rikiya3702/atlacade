require 'rails_helper'

RSpec.feature "Shops", type: :feature do
  scenario "ユーザーは新しいショップを作成する" do
    user = FactoryBot.create(:user, role: 1)
    shop = FactoryBot.build(:shop)

    visit root_path
    expect(page).to have_link 'ログイン', href: new_user_session_path
    within "#navmenu1" do
      click_link 'ログイン'
    end

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password

    click_button "ログイン"

    expect(page).to have_content "店舗データ登録"
    within "#navmenu1" do
       click_link "店舗データ登録"
    end

    expect{
      fill_in "店舗名", with: shop.shop_name
      fill_in "TEL", with: shop.tel

      expect(page).to have_content "※ 必須"
      expect(page).to have_unchecked_field('24時間営業')
      expect(page).to have_checked_field('禁煙')

      click_button "登録する"
      expect(page).to have_content "#{shop.shop_name}"
    }.to change(Shop, :count).by(1)
  end
end
