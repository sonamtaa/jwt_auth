# frozen_string_literal: true

require 'rails_helper'

describe 'Reset password' do
  let!(:user) { create(:user) }
  let!(:user1) { create(:employee) }
  let!(:token) { user_token(user) }

  let!(:params) do
    {
      user: { email: 'ba+a@selise.ch' }
    }
  end

  let!(:invalid_params) do
    {
      user: { email: 'invalid-email@selise.ch' }
    }
  end

  context 'when email is valid' do
    it 'sends password reset email' do
      post user_password_path(user), params: params, headers: header_params(token: toekn)
      expect(status).to eq(200)
    end
  end

  context 'with invalid password token' do
    before do
      user1.reset_password_token = SecureRandom.hex(28)
      user1.save
    end

    let!(:reset_params) do
      {
        user: {
          reset_password_token: user1.reload.reset_password_token,
          password: 'Selise30',
          password_confirmation: 'Selise30'
        }
      }
    end

    it 'does not updates password' do
      put user_password_path(user1), params: reset_params, headers: header_params(token:)
      expect(status).to eq(422)
    end
  end

  context 'with valid request' do
    let!(:tenant_admin) { create(:user, :tenant_admin) }
    let!(:admin_token) { user_token(tenant_admin) }
    let!(:params) do
      {
        user: {
          current_password: 'Selise20',
          password: 'Selise21',
          password_confirmation: 'Selise21'
        }
      }
    end

    it 'updates password for admin and then populate to other tenants' do
      put update_password_api_v1_auth_user_path(tenant_admin), params: params,
                                                               headers: header_params(token: admin_token)
      expect(status).to eq(200)
    end
  end
end
