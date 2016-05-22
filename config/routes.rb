Rails.application.routes.draw do
  namespace :editor do
    resources :sites do
      resources :tags
      resources :pages
      resources :binaries, :only => [:index, :new, :create]

      get 'binaries/(:name)', to: 'binaries#show', constraints: { name: /.*/}, as: 'binary_show'
    end
  end

  # viewer
  get ':path', to: 'viewer#show', constraints: { path: /.*/ }
end
