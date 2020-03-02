require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do

  describe "Create User" do

    context "Client not provided" do
      it 'create client' do  
        post "/api/v1/users", params: {email: 'test@gmail.com'}
        expect(response.status).to eq 422
      end
    end

    context "Client created" do
      let!(:client) {FactoryGirl.create(:client)}
      it 'return error' do  
        post "/api/v1/users", params: {domain: client.domain, email: 'test1@gmail.com'}
        res = JSON.parse(response.body)
        expect(response.status).to eq 200
      end
    end

  end
end
