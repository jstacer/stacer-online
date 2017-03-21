Rails.application.routes.draw do
  get 'static_pages/home'
  get '/resume', to: 'static_pages#resume'
  get '/projects', to: 'static_pages#projects'

  # LetsEncrypt route for new SSL certificates by Certbot
  get '/.well-known/acme-challenge/:id' => 'application#letsencrypt'

  root 'static_pages#home'
end