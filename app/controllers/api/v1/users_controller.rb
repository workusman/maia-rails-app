class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_client, only: %i[create]
  before_action :set_user, only: %i[create]

  def create
    begin
      @client.client_users.find_or_create_by user_id: @user.id
      render json: {status: 200}
    rescue Exception => e
      puts e.inspect
      render_error_message("User not created", 500)
    end
  end

  private
    def set_client
      render_error_message('Please provide client domain') unless params[:domain].present?
      @client = Client.find_or_create_by(domain: params[:domain])
    end

    def set_user
      @user = User.find_or_create_by(email: params[:email])
    end
end
