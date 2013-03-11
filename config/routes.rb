Corrasable::Application.routes.draw do
  post "/" => "analysis#report"
  post "/syllables" => "analysis#syllables"
end
