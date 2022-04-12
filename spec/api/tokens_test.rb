require 'rails_helper'
describe "Tokens < Grape::API" do
  describe "GET /api/v1/tokens" do
    it "validates a valid token" do
      get "/api/v1/tokens/9121328067"
      expect(response.status).to eq 200
    end

    it "validates a non Luhn token" do
      get "/api/v1/tokens/9564782154"
      expect(response.status).to eq 404
    end

    it "validates a token that doesn't start with 9" do
      get "/api/v1/tokens/6121328067"
      expect(response.status).to eq 400
    end

    it "validates a token that is too short" do
      get "/api/v1/tokens/912132806"
      expect(response.status).to eq 400
    end

    it "validates a token that is too long" do
      get "/api/v1/tokens/91213280633"
      expect(response.status).to eq 400
    end
  end

  describe "GET /api/v1/tokens" do
    it "Gets the two assigned tokens" do
      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      expect(response.status).to eq 201
      post "/api/v1/users", :params =>  {email: "test2@email.com", name: "Mr Tests Son"}
      expect(response.status).to eq 201

      get "/api/v1/tokens"
      body = JSON.parse response.body
      expect(response.status).to eq 200
      expect(body.length).to eq 2
    end
  end

  describe "GET /api/v1/tokens/:token/email/:email" do
    it "Verifies the token is assigned to the user" do
      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      expect(response.status).to eq 201
      body = JSON.parse response.body
      this_token = body["token"]

      get "/api/v1/tokens/" + this_token + "/email/test@email.com"
      expect(response.status).to eq 200
    end

    it "Verifies the token is NOT assigned to the user" do
      post "/api/v1/users", :params =>  {email: "test@email.com", name: "Mr Test"}
      expect(response.status).to eq 201

      get "/api/v1/tokens/9121328067/email/test@email.com"
      expect(response.status).to eq 404
    end
  end
end