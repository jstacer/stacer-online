Rails.application.routes.draw do

  # gives browser console for Sidekiq queue
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
  # mount ActionCable.server, at: '/cable'

  get 'static_pages/home'
  get '/resume', to: 'static_pages#resume'
  get '/projects', to: 'static_pages#projects'
  get '/projects/blackjack', to: 'blackjack#index', as: 'blackjack'
  get '/blackjack', to: redirect('/projects/blackjack')
  # post '/blackjack',  to: 'blackjack#post'

  root 'static_pages#home'
end