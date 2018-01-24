module KalixaApi
  module V4
    class Merchant

    def initialize
      @http_service = KalixaApi::V4::HttpService.new
    end

    def get_merchant_user(merchant_id, user_id)
      @http_service.get_request("api/v4/merchants/#{merchant_id}/users/#{user_id}")
    end

    end
  end
end


