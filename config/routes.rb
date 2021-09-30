Rails.application.routes.draw do
 root 'static_pages#deal'
  get '/static_pages', to: 'static_pages#deal'
end
