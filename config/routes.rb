Corrasable::Application.routes.draw do
  get  "/"          => "application#home"
  post "/"          => "analysis#report", defaults: { format: "json" }
  post "/syllables" => "analysis#syllables", defaults: { format: "json" }
  post "/phonemes"  => "conversion#phonemes", defaults: { format: "json" }
  post "/nato"      => "conversion#nato", defaults: { format: "json" }

  resources :words, defaults: { format: "json" }
end
