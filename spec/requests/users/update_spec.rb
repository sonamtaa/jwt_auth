# frozen_string_literal: true

require 'rails_helper'

describe User, '#update' do
  let!(:admin) { create(:role) }
  let!(:employee_role) { create(:role, :employee) }
  let!(:user) { create(:user, :employee) }
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
      put "/users/#{user.id}", params: account_update_params, headers: header_params(token:)
      expect(status).to eq(200)
    end
  end

  context 'when password and password confirmation do not match' do
    it 'throws error' do
      put "/users/#{user.id}", params: invalid_account_params, headers: header_params(token:)
      expect(json['errors']).to eq(["Password confirmation doesn't match Password"])
    end
  end
end
