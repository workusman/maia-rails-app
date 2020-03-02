class ApplicationController < ActionController::API
  
  def render_error_message(message, status = :unprocessable_entity)
    render json: {
      result: "error",
      errors: [
        meta: {
          message: message
        }
      ]
    }, status: status
  end

end
