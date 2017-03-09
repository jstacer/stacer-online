class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "This site is under construction."
  end

  def letsencrypt
  	render text: "#{params[:id]}.2bCGjv0RsO_BjxveJofHn7TRztmtPbj79C4L1iKSG8g"
  end
end