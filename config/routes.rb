Rails.application.routes.draw do
  get "/health", to: "health#index"

  devise_for :users,
    path: "",
    path_names: {
      sign_in: "auth/login",
      sign_out: "auth/logout",
      registration: "auth/signup"
    },
    controllers: {
      sessions: "auth/sessions",
      registrations: "auth/registrations"
    }

  namespace :api do
    namespace :v1 do
      resources :patient_records, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show]
    end
  end
end