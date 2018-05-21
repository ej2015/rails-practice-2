Rails.application.routes.draw do

	post "checks", to: "policies#checks"

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
