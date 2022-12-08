# frozen_string_literal: true

require 'rails_helper'

describe User, '#index' do
  let!(:admin) { create(:role) }
  let!(:role_employee) { create(:role, :employee) }
  let!(:user) { create(:user) }
  let!(:user1) { create(:user, :employees) }
  let!(:token) { user_token(user) }

  context 'without any filters' do
    it 'lists all the users' do
      get users_path, headers: header_params(token:)
      expect(status).to eq(200)
      expect(json.count).to eq(2)
    end
  end
end
