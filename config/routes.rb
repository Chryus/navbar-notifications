Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :forum_threads do
    resources :forum_posts
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  devise_scope :user do
    # authenticated :user do
    #   root 'home#index', as: :authenticated_root
    # end
    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end
end
