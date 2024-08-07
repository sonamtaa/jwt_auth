# frozen_string_literal: true

require 'rails_helper'

describe User, '#create' do
  let!(:role) { create(:role) }
  let!(:params) do
    {
      user: {
        email: 'st+e@gmail.com',
        username: 'sonamtaahee',
        name: 'Sonam Tashi',
        role_id: role.id,
        password: 'Testinf22',
        password_confirmation: 'Testinf22'
      }
    }
  end

  let!(:invalid_params) do
    {
      user: {
        email: 'st+e@gmail.com',
        username: 'sonamtaahee',
        name: 'Sonam Tashi',
        role_id: role.id,
        password: 'Testing22',
        password_confirmation: 'Testinf22'
      }
    }
  end

  context 'with valid params' do
    it 'create the user account' do
      post users_path, params: params
      expect(status).to eq(201)
      expect(json[:email]).to eq('st+e@gmail.com')
      expect(json[:username]).to eq('sonamtaahee')
    end
  end

  context 'when password and password confirmation do not match' do
    it 'throws error' do
      post users_path, params: invalid_params
      expect(status).to eq(422)
      expect(json[:errors]).to eq(["Password confirmation doesn't match Password"])
    end
  end
end
