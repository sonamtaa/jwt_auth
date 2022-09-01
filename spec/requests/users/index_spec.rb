# frozen_string_literal: true

require 'rails_helper'

describe User, '#index' do
  let!(:user) { create(:user) }
  let!(:token) { user_token(user) }
  let!(:rejected_user) { create(:user, :rejected) }
  let!(:non_portal_user) { create(:user, :non_portal) }
  let!(:suspended_user) { create(:user, :suspended) }
  let!(:fleet_manager) { create(:fleet_manager) }
  let!(:cost_center_user) { create(:employee) }
  let!(:fleet_token) { user_token(fleet_manager) }
  let!(:cost_center_token) { user_token(cost_center_user) }

  before do
    clear_read_models
    UserList.find_by(ref_id: cost_center_user.id).update(cost_center_id: 2)
  end

  context 'without any filters' do
    it 'lists all the users' do
      get api_v1_auth_users_path, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json.dig(:meta, :current)).to eq(1)
      expect(json.dig(:meta, :total)).to eq(6)
    end

    it 'fetches user by status:approved' do
      get api_v1_auth_users_path, params: { status: 'approved' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(5)
    end

    it 'fetches user by status:rejected' do
      get api_v1_auth_users_path, params: { status: 'rejected' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'fetches portal access users' do
      get api_v1_auth_users_path, params: { portal_access: true }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(5)
    end

    it 'fetches non-portal access users' do
      get api_v1_auth_users_path, params: { portal_access: false }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'fetches suspended users' do
      get api_v1_auth_users_path, params: { suspension: true }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'fetches non-suspended users' do
      get api_v1_auth_users_path, params: { suspension: false }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(5)
    end

    it 'fetches active users' do
      get api_v1_auth_users_path, params: { active: true }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(3)
    end

    it 'fetches inactive users' do
      get api_v1_auth_users_path, params: { active: false }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(3)
    end

    it 'fetches user by role' do
      get api_v1_auth_users_path, params: { role_name: 'fleet_manager' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'searches user by name' do
      get api_v1_auth_users_path, params: { query: 'Bhagawat Adhikari' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(6)
    end

    it 'searches user by employee number' do
      fleet_manager.profile.update(employee_number: '12322211')
      UserListUpdator.new(resource: fleet_manager).build
      get api_v1_auth_users_path, params: { employee_number: '12322211' }, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'gets current user' do
      get current_api_v1_auth_users_path, params: {}, headers: header_params(token:)
      expect(status).to eq(200)
    end

    it 'fetches users assigned to fleet manager' do
      get api_v1_auth_users_path, params: {}, headers: header_params(token: fleet_token)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end

    it 'fetches users by cost center assigned' do
      get api_v1_auth_users_path, params: { cost_center_id: 2 }, headers: header_params(token: cost_center_token)
      expect(status).to eq(200)
      expect(json[:users].size).to eq(1)
    end
  end
end
