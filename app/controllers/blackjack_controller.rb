class BlackjackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def get
  end

  def post
    # text = params[:input]
    # BlackjackWorker.perform_async(text)
    # response = {:text => text}
    # render json: response
  end

end
