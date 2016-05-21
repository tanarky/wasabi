Rails.application.routes.draw do
  namespace :editor do
    resources :sites do
      resources :tags
      resources :pages
    end
  end

  # viewer
  get ':path', to: 'viewer#show', constraints: { path: /.*/ }
end
