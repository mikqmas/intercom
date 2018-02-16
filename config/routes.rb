Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :merchants, only: [:show, :create, :destroy] do
      resources :employees, only: [:index, :create, :show, :destroy, :update] do
        resources :groups, only: [:index, :create, :show] do
          resources :messages, only: [:index, :show, :create, :destroy, :update]
        end
      end
    end
  end
end
