Rails.application.routes.draw do
  resources :articles
  get '/searchs' => 'searchs#show', :defaults => { :format => 'json'},  :as => :searchs
  root to: 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
