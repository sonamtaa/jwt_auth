# frozen_string_literal: true

require 'rails_helper'

describe 'Reset password' do
  let!(:user) { create(:user) }
  let!(:user1) { create(:user, :employee) }
  let!(:token) { user_token(user) }

  let!(:params) do
    {
      user: { email: 'st+a@gmail.com' }
    }
  end

  let!(:invalid_params) do
    {
      user: { email: 'invalid-email@gmail.com' }
    }
  end

  xcontext 'when email is valid' do
    it 'sends password reset email' do
      post user_password_path(user), params:, headers: header_params(token: toekn)
      expect(status).to eq(200)
    end
  end

  xcontext 'with invalid password token' do
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
end
