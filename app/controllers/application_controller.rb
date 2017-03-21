class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Used for getting SSL certificates
  def letsencrypt
  	render text: "#{params[:id]}.2bCGjv0RsO_BjxveJofHn7TRztmtPbj79C4L1iKSG8g"
  end
end