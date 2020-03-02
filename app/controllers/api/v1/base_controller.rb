class Api::V1::BaseController < ApplicationController

  def version
    render json: { version: 'Maia-App-V1' }
  end
end