Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'
  post '/webhooks/telegram_f7d32d1b1f7e6ace857fcb55f47516f12a657c63' => 'webhooks#callback'
end
