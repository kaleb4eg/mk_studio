Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root 'home#index', defaults: { page_title: 'about_us' }
    get 'about_us' => 'home#index', as: :about_us, defaults: { page_title: 'about_us' }
    get 'contacts' => 'home#index', as: :contacts, defaults: { page_title: 'contacts' }
    get 'services' => 'home#services', as: :services
    get 'projects' => 'home#projects', as: :projects
    get 'project/:id' => 'home#project', as: :project

    namespace :admin do
      get '/' => 'pages#index'
      resources :pages do
        resources :page_images, except: [:index, :show] do
          post 'sort', on: :collection
        end
      end
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
end
