class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "This site is under construction."
  end

  def letsencrypt
  	render text: "#{params[:id]}.-second-part-of-string-random-characters"
  end
end