require 'rails_helper'

RSpec.describe Api::BaseController, :type => :controller do
  let(:valid_key) { ApiKey.key_for_role("internal_api_client") }

  before(:each) do
    @controller = Api::V1::ListsController.new
  end

  it "should return unauthorized if api-key is not provided" do
    @request.headers["X-Fuderlist-API-Key"] = nil
    get :index
    expect(response.status).to eq(401)
  end

  it "should return unauthorized if wrong api-key is provided" do
    @request.headers["X-Fuderlist-API-Key"] = "incorrect-key"
    get :index
    expect(response.status).to eq(401)
  end

  it "should return success if api-key is provided" do
    @request.headers["X-Fuderlist-API-Key"] = valid_key
    get :index
    expect(response.status).to eq(200)
  end
end
