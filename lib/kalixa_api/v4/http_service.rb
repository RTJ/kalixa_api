module KalixaApi
  module V4
    class HttpService

      attr_accessor :kalixa_api_user, :kalixa_api_password, :test_kalixa_api_user, :test_kalixa_api_password, :api_test_mode

      def initialize(username: nil, password: nil)
        @kalixa_api_user = kalixa_api_user || KalixaApi.kalixa_api_user
        @kalixa_api_password = kalixa_api_password || KalixaApi.kalixa_api_password
        @test_kalixa_api_user = test_kalixa_api_user || KalixaApi.test_kalixa_api_user
        @test_kalixa_api_password = test_kalixa_api_password || KalixaApi.test_kalixa_api_password

        @api_test_mode = api_test_mode || KalixaApi.api_test_mode
      end

      def connection
        @connection ||= begin
          Faraday.new(:url => 'https://payments.kalixa.com') do |faraday|
            faraday.response :json, :content_type => /\bjson$/
            faraday.basic_auth(@kalixa_api_user , @kalixa_api_password)
            faraday.adapter  Faraday.default_adapter
          end
        end
      end

      def test_conection
        @test_connection ||= begin
          Faraday.new(:url => 'https://payments.test.kalixa.com') do |faraday|
            faraday.response :json, :content_type => /\bjson$/
            faraday.basic_auth(@test_kalixa_api_user, @test_kalixa_api_password)
            faraday.adapter  Faraday.default_adapter
          end
        end
      end

      def post_request(url, data = {})
        if @api_test_mode
          test_conection.post do |req|
            req.url url
            req.headers['Content-Type'] = 'application/json'
            req.body = data.to_json
          end
        else
          connection.post do |req|
            req.url url
            req.headers['Content-Type'] = 'application/json'
            req.body = data.to_json
          end
        end
      end

      def get_request(url, data = {})
        if @api_test_mode
          test_conection.get do |req|
            req.url url
            req.headers['Content-Type'] = 'application/json'
          end
        else
          connection.get do |req|
            req.url url
            req.headers['Content-Type'] = 'application/json'
            req.body = data.to_json
          end
        end
      end

    end
  end
end


