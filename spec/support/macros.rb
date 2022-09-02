# frozen_string_literal: true

def user_token(user)
  post '/auth/login', params: { user: { email: user.email, password: user.password } }
  json['token']
end

def header_params(args = {})
  {
    Authorization: args[:token],
    Accept: 'Application/json',
    HTTP_ACCEPT_LANGUAGE: args[:locale] || 'en',
    HTTP_HOST: args[:http_host] || 'test.lvh.me:3000'
  }
end

def json
  result = JSON.parse(response.body)
  result.is_a?(Array) ? result : HashWithIndifferentAccess.new(result)
end
