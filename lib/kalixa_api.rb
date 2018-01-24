require 'faraday_middleware'
require 'json'
require 'active_support/core_ext/hash/indifferent_access'

require "kalixa_api/version"

require 'kalixa_api/v3/http_service'
require 'kalixa_api/v4/http_service'
require 'kalixa_api/v4/merchant'


module KalixaApi
  class << self
    attr_accessor :kalixa_api_user, :kalixa_api_password, :test_kalixa_api_user, :test_kalixa_api_password, :api_mode
  end

  self.kalixa_api_user ||= ENV['KALIXA_API_USER']
  self.kalixa_api_password ||= ENV['KALIXA_API_PASSWORD']

  self.test_kalixa_api_user ||= ENV['TEST_KALIXA_API_USER']
  self.test_kalixa_api_password ||= ENV['TEST_KALIXA_API_PASSWORD']

  self.api_mode ||= (ENV['KALIXA_API_MODE'].downcase == 'production')
end
