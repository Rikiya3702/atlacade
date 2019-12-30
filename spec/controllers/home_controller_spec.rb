require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "#index" do
    it "200レスポンスを返す事" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#about" do
    it "200レスポンスを返す事" do
      get :about
      expect(response).to have_http_status "200"
    end
  end
  
end
