Rails.application.routes.draw do
  namespace :editor do
    resources :sites
  end

  # viewer
  get ':path', to: 'application#show', constraints: { path: /.*/ }
end
