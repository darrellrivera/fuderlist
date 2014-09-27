require 'rails_helper'

RSpec.describe Api::V1::ListsController, :type => :controller do
  before(:each) do
    @request.headers["X-Fuderlist-API-Key"] = ApiKey.key_for_role("internal_api_client")
  end

  describe "get to :index" do
    it "should return success" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should return json response of all lists" do
      list = FactoryGirl.create(:list)
      get :index
      expect(response.body).to eq(List.all.to_json)
    end
  end
end
