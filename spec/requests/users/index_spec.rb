# frozen_string_literal: true

require 'rails_helper'

describe User, '#index' do
  let!(:user) { create(:user) }
  let!(:token) { user_token(user) }

  context 'without any filters' do
    it 'lists all the users' do
      get api_v1_auth_users_path, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json.dig(:meta, :current)).to eq(1)
      expect(json.dig(:meta, :total)).to eq(2)
    end

    it 'fetches active users' do
      get api_v1_auth_users_path, params: { active: true }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'fetches user by role' do
      get api_v1_auth_users_path, params: { role_name: 'employee' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'searches user by name' do
      get api_v1_auth_users_path, params: { query: 'Sonam' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'gets current user' do
      get current_api_v1_auth_users_path, params: {}, headers: header_params(token:)
      expect(status).to eq(200)
    end
  end
end
