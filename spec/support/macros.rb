# frozen_string_literal: true

def user_token(user)
  post user_session_url, params: { user: { email: user.email, password: user.password } }
  response.header['Authorization']
end

def header_params(args = {})
  { Authorization: args[:token], Accept: 'Application/json', HTTP_ACCEPT_LANGUAGE: args[:locale] || 'en' }
end

def json
  result = JSON.parse(response.body)
  result.is_a?(Array) ? result : HashWithIndifferentAccess.new(result)
end
