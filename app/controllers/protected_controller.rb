class ProtectedController < ApplicationController
  before_action :require_login

  def index
    render json: { message: "Welcome to the protected area :)", user_info: current_user }
  end

  private

  def require_login
    render json: { error: "Unauthorized access" }, status: :unauthorized unless current_user
  end
end
