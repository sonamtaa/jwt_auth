# frozen_string_literal: true

require 'rails_helper'

describe User, '#show' do
  let!(:user) { create(:user) }
  let!(:token) { user_token(user) }

  before { clear_read_models }

  it 'gets user details' do
    get api_v1_auth_user_path(user), params: {}, headers: header_params(token:)
    expect(status).to eq(200)
  end
end
