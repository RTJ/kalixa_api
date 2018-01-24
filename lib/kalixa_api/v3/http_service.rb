module KalixaApi
  module V3
    class HttpService

      attr_accessor :api_user, :api_password, :test_api_user, :test_api_password, :api_mode

      def initialize(api_user: nil, api_password: nil, test_api_user: nil, test_api_password: nil, api_mode: nil)
        @api_user = api_user || KalixaApi.api_user
        @api_password = api_password || KalixaApi.api_password
        @test_api_user = test_api_user || KalixaApi.test_api_user
        @test_api_password = test_api_password || KalixaApi.test_api_password
        @api_mode = api_mode || KalixaApi.api_mode
      end

      def connection
        @connection ||= begin
          Faraday.new(:url => 'https://api.kalixa.com') do |faraday|
            faraday.basic_auth(@api_user , @api_password)
            faraday.adapter  Faraday.default_adapter
          end
        end
      end

      def test_conection
        @connection ||= begin
          Faraday.new(:url => 'https://api.test.kalixa.com') do |faraday|
            faraday.basic_auth(@test_api_user, @test_api_password)
            faraday.adapter  Faraday.default_adapter
          end
        end
      end

      def post_request(url, data, xml_root)
        if @api_mode
          connection.post do |req|
            req.url url
            req.headers['Content-Type'] = 'application/xml; charset=utf-8'
            req.body = data.to_xml(:root => xml_root)
          end
        else
          test_conection.post do |req|
            req.url url
            req.headers['Content-Type'] = 'application/xml; charset=utf-8'
            req.body = data.to_xml(:root => xml_root)
          end
        end
      end

      def get_request(url, data, xml_root)
        if @api_mode
          connection.get do |req|
            req.url url
            req.headers['Content-Type'] = 'application/xml; charset=utf-8'
            req.body = data.to_xml(:root => xml_root)
          end
        else
          test_conection.get do |req|
            req.url url
            req.headers['Content-Type'] = 'application/xml; charset=utf-8'
            req.body = data.to_xml(:root => xml_root)
          end
        end
      end

    end
  end
end


