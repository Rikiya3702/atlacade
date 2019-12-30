require 'rails_helper'

RSpec.describe ShopsController, type: :controller do

  describe "#index" do
    it "200レスポンスを返す事" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    before do
      @shop = FactoryBot.create(:shop)
    end

    it "200レスポンスを返す事" do
      get :show, params: {id: @shop.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#new" do
    context "認証済みユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常なレスポンスを返す事" do
        sign_in @user
        get :new
        expect(response).to be_success
      end

      it "200レスポンスを返す事" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end

    context "ゲストとして" do
      it "302レスポンスを返す事" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "ログイン画面へリダイレクトする事" do
        get :new
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#create" do
    context "認証済みユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "ショップを登録できる事" do
        shop_params = FactoryBot.attributes_for(:shop)
        tag_params  = FactoryBot.attributes_for(:tag)
        sign_in @user
        expect{ post :create,
               params: {shop: shop_params, tag: tag_params}}.to change(Shop, :count).by(1)
      end
    end
    context "ゲストとして" do
      it "ログイン画面へリダイレクトする事" do
        shop_params = FactoryBot.attributes_for(:shop)
        tag_params  = FactoryBot.attributes_for(:tag)
        post :create, params: {shop: shop_params, tag: tag_params}
        expect{response}.to redirect_to "/users/sign_in"
      end
    end
  end
end
