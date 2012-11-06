WhichWidget::Application.routes.draw do
  get "welcome/index"
  devise_for :users

  match 'weather/forecast/:state/:city' => "weather#forecast"
  # http://localhost:3000/weather/conditions/TX/Austin.json?q=temp_f
  match 'weather/conditions/:state/:city' => "weather#conditions"

  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"
end
