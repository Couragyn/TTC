require 'rails_helper'
describe "Users < Grape::API" do
  describe "POST /api/v1/users" do
    it "should return a status code 201 and contain token and expiry, then fail on second post with same email" do
      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      body = JSON.parse response.body
      expect(response.status).to eq 201
      expect(body["token"]).to be_present
      expect(body["expiry"]).to eq (Date.today + 60.days).strftime("%Y-%m-%d")

      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      expect(response.status).to eq 400
    end
  end

  describe "GET /api/v1/users/:email" do
    it "should return a status code 201 and contain token and expiry, then fail on second post with same email" do
      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      expect(response.status).to eq 201
      
      get "/api/v1/users/test@email.com"
      body = JSON.parse response.body
      expect(response.status).to eq 200
      expect(body["name"]).to eq "Mr Test"
    end
  end

  describe "GET /api/v1/users" do
    it "should return a status code 200 and 2 users" do
      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      expect(response.status).to eq 201
      post "/api/v1/users", :params =>  {email: "test2@email.com", name: "Mr Tests Son"}
      expect(response.status).to eq 201

      get "/api/v1/users"
      expect(response.status).to eq 200
      body = JSON.parse response.body
      expect(body.length).to eq 2
    end
  end
end