Rails.application.routes.draw do
    root 'sessions#new'

    get 'sessions/new'

    post 'sessions' => 'sessions#create'

    post 'login' => 'sessions#login'

    delete "sessions/:id" => "sessions#destroy"

    get 'groups' => "groups#index"

    post 'groups' => 'groups#create'

    get 'groups/:id' => 'groups#show'

    get 'groups/join/:id' => 'groups#join'

    get 'groups/leave/:id' => 'groups#leave'

    delete 'groups/:id' => 'groups#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
