require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #create_ao" do
    it "returns http success" do
      get :create_ao
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create_user" do
    it "returns http success" do
      get :create_user
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #logout" do
    it "returns http success" do
      get :logout
      expect(response).to have_http_status(:success)
    end
  end

end
