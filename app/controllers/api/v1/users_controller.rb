class Api::V1::UsersController < ApplicationController
  before_action :set_client, only: %i[create]
  before_action :set_user, only: %i[create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    begin
      @client.users.find_or_create_by email: @user.email
      render json: {status: 200}
    rescue Exception => e
      render_error_message("User not created", 500)
    end
  end

  private
    def set_client
      @client = Client.find__or_create_by(secret_key: params[:domain])
      render_error_message('Client not Found') unless @client.present?
    end

    def set_user
      @user = User.find_or_initialize_by(email: params[:email])
    end
end
