# frozen_string_literal: true

require 'rails_helper'

describe 'User registration' do
  let!(:params) do
    {
      user: {
        email: 'st+user@selise.ch',
        role_id: Role.second.id,
        active: true,
        profile_attributes: {
          first_name: 'Sonam',
          last_name: 'Tashi',
          phone: '+97517524816',
          salutation: 'Mr',
          designation: 'Developer',
          image_url: Faker::LoremPixel.image,
          user_address_attributes: {
            street_name: 'Erdman Wall',
            street_no: '137',
            city: 'Lake Beverlymouth',
            zip: '4051',
            state: 'Iowa',
            country: 'Iceland',
            description: 'cold place',
            additional_address: 'Near town',
            post_box_no: '2'
          }
        }
      }
    }
  end
  let!(:invalid_params) do
    {
      user: {
        email: 'Testing',
        role_id: 2,
        active: false
      }
    }
  end

  context 'with valid params' do
    it 'registers the user' do
      post user_registration_path, params: params, headers: {}
      expect(status).to eq(200)
      expect(json.dig(:user, :email)).to eq('st+user@selise.ch')
    end
  end

  context 'with auto approve' do
    let!(:tenant) { Tenant.find_by(app_name: Apartment::Tenant.current) }
    let!(:tenant_domain_list) { create(:tenant_domain_list) }
    let!(:tenant_admin) { create(:user, :tenant_admin) }

    before do
      tenant_domain_list.update!(
        tenant_id: tenant.id,
        auto_approve: true,
        email_domains: ['selise.ch'],
        allow_email_domain: true
      )
    end

    it 'auto approves user when user registers' do
      post user_registration_path, params: params, headers: {}
      expect(status).to eq(200)
      user = User.find(json.dig('user', 'id'))
      expect(user.status).to eq('approved')
      expect(user.active).to be(true)
      expect(user.suspension).to be(false)
      expect(user.portal_access).to be(true)
    end
  end

  context 'with invalid params' do
    it 'does not registers the user' do
      post user_registration_path, params: invalid_params, headers: {}
      expect(status).to eq(422)
    end
  end
end
