Rails.application.routes.draw do
  root 'members#index'
  resources :members do
  end
end
