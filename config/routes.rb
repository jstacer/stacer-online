Rails.application.routes.draw do
  root 'application#hello'

  # Let’s encrypt
  # get '/.well-known/acme-challenge/:id' => 'application#letsencrypt'
end