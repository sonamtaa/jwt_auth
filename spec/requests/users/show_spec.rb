# frozen_string_literal: true

require 'rails_helper'

describe User, '#show' do
  let!(:user) { create(:user) }
  let!(:token) { user_token(user) }

  it 'gets user details' do
    get user_path(user.username), params: {}, headers: header_params(token:)
    expect(status).to eq(200)
    expect(json['name']).to eq(user.name)
    expect(json['email']).to eq(user.email)
  end
end
