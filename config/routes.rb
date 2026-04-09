Rails.application.routes.draw do
  root to: 'items#index'
  get "up" => "rails/health#show", as: :rails_health_check
end