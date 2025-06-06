class Api::V1::HealthController < ApplicationController
  def index
    render json: {
      status: 'ok',
      message: 'API is running',
      timestamp: Time.current,
      environment: Rails.env
    }
  end
end