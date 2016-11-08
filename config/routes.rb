# rubocop:disable Metrics/BlockLength

Corrasable::Application.routes.draw do
  get  '/' => 'application#home'

  post '' => 'analysis#report'
  post '/syllables' => 'analysis#syllables'
  post '/phonemes' => 'conversion#phonemes'
  post '/nato' => 'conversion#nato'

  resources :words, only: [:show]

  resources :tags, only: [:index] do
    collection do
      get :tagged
      post :tagged
      get :parts
      post :parts
    end
  end

  namespace :conversion do
    get :phonemes
    post :phonemes
    get :nato
    post :nato
  end

  namespace :analysis do
    get :syllables
    post :syllables
    get :report
    post :report
  end
end
