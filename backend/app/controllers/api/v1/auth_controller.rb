class Api::V1::AuthController < ApplicationController
  # POST /api/v1/login
  def login
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      if user.confirmed?
        token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
        render json: { token: token, user: { id: user.id, email: user.email, name: user.name } }, status: :ok
      else
        render json: { error: 'Email not confirmed' }, status: :unauthorized
      end
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # POST /api/v1/register
  def register
    user = User.new(user_params)
    if user.save
      token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
      render json: { token: token, user: { id: user.id, email: user.email, name: user.name } }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
