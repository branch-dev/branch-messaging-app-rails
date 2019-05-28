Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers, only: [:index, :show] do
    collection do
      match :test, via: [:get, :post]
    end
    member do
      post :send_message
    end
  end
end
