class Api::V1::UsersController < ApplicationController
  before_action :set_client, only: %i[create]
  before_action :set_user, only: %i[create]
  
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
      render_error_message('Please provide client domain') unless params[:domain].present?
      @client = Client.find_or_create_by(domain: params[:domain])
    end

    def set_user
      @user = User.find_or_initialize_by(email: params[:email])
    end
end
