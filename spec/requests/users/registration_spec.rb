# frozen_string_literal: true

require 'rails_helper'

describe 'User Registration' do
  let!(:params) do
    {
      user: {
        name: 'Sonam tashi',
        username: 'sonataa',
        email: 'st+user@gmail.com',
        password: 'Test20',
        password_confirmation: 'Test20'
      }
    }
  end

  let!(:invalid_params) do
    {
      user: {
        name: 'Sonam tashi',
        username: 'sonataa',
        password: 'Test20',
        password_confirmation: 'Test20',
        email: 'Testing'
      }
    }
  end

  context 'with valid params' do
    it 'registers the user' do
      post users_path, params: params, headers: {}
      expect(status).to eq(201)
      expect(json[:email]).to eq('st+user@gmail.com')
    end
  end

  context 'with invalid params' do
    it 'does not registers the user' do
      post users_path, params: invalid_params, headers: {}
      expect(status).to eq(422)
    end
  end
end
