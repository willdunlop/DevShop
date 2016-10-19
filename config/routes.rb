Rails.application.routes.draw do
  resources :contracts
  resources :dev_corners
  resources :profiles
  get 'pages/home'
  root 'pages#home'
  devise_for :users

  resources :conversations do
  resources :messages
 end

  resources :dev_corners do
    member do
      put "voteone", to: "dev_corners#voteone"
      put "votetwo", to: "dev_corners#votetwo"
      put "votethree", to: "dev_corners#votethree"
      put "votefour", to: "dev_corners#votefour"
      put "votefive", to: "dev_corners#votefive"
      put "unvote", to: "dev_corners#unvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
