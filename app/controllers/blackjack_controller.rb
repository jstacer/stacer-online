class BlackjackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def get
  end

  def post
    text = params[:input]
    response = {:text => text}
    BlackjackWorker.perform_async(text)
    render json: response
  end

end
