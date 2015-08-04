Maktoub::Engine.routes.draw do
  get 'newsletter/(:newsletter)' => 'archives#show', as: 'newsletter'

  root to: 'archives#show'

  resource :subscribers, only: [:edit, :update]
end
