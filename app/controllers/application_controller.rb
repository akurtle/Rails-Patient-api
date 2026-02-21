# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found


  private

  def user_not_authorized
    render json: { error: "forbidden" }, status: :forbidden
  end

  def not_found
    render json: { error: "not_found" }, status: :not_found
  end
end