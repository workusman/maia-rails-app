require 'rails_helper'

RSpec.describe Client, type: :model do
  describe "Create Client" do
    let!(:client) {FactoryGirl.create(:client)}
    it 'update the domain' do  
      client.update(domain: 'www.test2.com')
      expect(client.domain).to eq 'www.test2.com'
    end
  end
end
