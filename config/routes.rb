Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :lines

      resources :interactions

      resources :photos

      resources :user_rooms

      resources :rooms
      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "rooms#index"
  resources :lines
  resources :interactions
  resources :photos
  resources :user_rooms
  get "liked_rooms" => "rooms#likes"
  resources :rooms
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
