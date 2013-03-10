Corrasable::Application.routes.draw do
  post "/" => "analysis#report"

  post "/sentences" => "analysis#sentences"
  post "/syllables" => "analysis#syllables"
end
