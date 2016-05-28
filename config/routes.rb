Rails.application.routes.draw do
  namespace :editor do
    resources :sites do
      resources :tags
      resources :pages
      resources :binaries, :only => [:index, :new, :create]

      
    end
  end

  namespace :viewer do
    get 'sites/(:site_name)/pages/(:page_name)',
        to: 'pages#show',
        constraints: { site_name: /[^\/]*/, page_name: /.*/},
        as: 'page_show'
    get 'sites/(:site_name)/binaries/(:binary_name)',
        to: 'binaries#show',
        constraints: { site_name: /[^\/]*/, binary_name: /.*/},
        as: 'binary_show'
  end

  ## viewer
  #get ':path', to: 'viewer#show', constraints: { path: /.*/ }
end
