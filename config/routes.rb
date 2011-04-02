Todo::Application.routes.draw do

  root :to => "home#index"

  devise_for :users

  resources :users do
    resources :lists, :controller => 'users/lists' do
      resources :tasks, :controller => 'users/lists/tasks', :only => :update
    end
    
    resources :watching, :controller => 'users/watching', :only => [:index, :show]
  end

  resources :lists do
    resources :watchers, :controller => 'lists/watchers', :only => [:create, :destroy]
  end

end
