require "test_helper"

module Api
  module V1
    class HealthControllerTest < ActionDispatch::IntegrationTest
      test "should get health status" do
        get api_v1_health_url
        assert_response :success
        json = JSON.parse(@response.body)
        assert_equal 'ok', json['status']
        assert_equal 'API is running', json['message']
        assert json['timestamp']
        assert json['environment']
      end
    end
  end
end
