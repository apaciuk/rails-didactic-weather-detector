# Below are the routes for madmin
namespace :madmin do
  resources :users
  resources :services
  resources :announcements
  resources :notifications
  namespace :active_storage do
    resources :variant_records
  end
  namespace :active_storage do
    resources :attachments
  end
  namespace :active_storage do
    resources :blobs
  end
  root to: "dashboard#show"
end
