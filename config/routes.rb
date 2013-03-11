Corrasable::Application.routes.draw do
  post "/" => "analysis#report", defaults: { format: "json" }
  post "/syllables" => "analysis#syllables", defaults: { format: "json" }
  resources :words, defaults: { format: "json" }
end
