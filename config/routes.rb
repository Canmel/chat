Rails.application.routes.draw do
  devise_for :users,controllers: {sessions:"users/sessions" }, path: "auth",
             path_names: { sign_in: 'login', sign_out: 'logout' }

  root :to => "home#index"

  resources :messages do
    member do
      get "to_examine"
    end
    collection do
      get "show_all"
    end
  end

  get "signatures/signature"
end