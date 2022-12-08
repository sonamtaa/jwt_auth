# frozen_string_literal: true

require 'rails_helper'

describe User, '#update' do
  let!(:admin) { create(:role) }
  let!(:user) { create(:employee) }
  let!(:token) { user_token(user) }
  let!(:account_update_params) do
    {
      user: {
        email: 'st+e@gmail.com',
        password: 'Testinf22',
        password_confirmation: 'Testinf22',
        current_password: 'Testinf20'
      }
    }
  end

  let!(:invalid_account_params) do
    {
      user: {
        email: 'st+e@gmail.com',
        password: 'Testinf22',
        password_confirmation: 'Testinf22sss',
        current_password: 'Testinf20'
      }
    }
  end

  context 'with valid params' do
    it 'updates the user account' do
      put update_password_api_v1_auth_user_path(user), params: account_update_params,
                                                       headers: header_params(token:)
      expect(status).to eq(200)
    end
  end

  context 'when password and password confirmation do not match' do
    it 'throws error' do
      put update_password_api_v1_auth_user_path(user), params: invalid_account_params,
                                                       headers: header_params(token:)
      expect(json[:password_confirmation]).to eq(["doesn't match Password"])
    end
  end
end
