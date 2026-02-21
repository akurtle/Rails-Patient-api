# frozen_string_literal: true

module Api
  module V1
    class UsersController < BaseController
      def index
        authorize User
        users = User.order(:id)
        render json: users.as_json(only: [:id, :email, :role])
      end

      def show
        user = User.find(params[:id])
        authorize user
        render json: user.as_json(only: [:id, :email, :role])
      end
    end
  end
end