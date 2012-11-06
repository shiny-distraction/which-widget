WhichWidget::Application.routes.draw do
  match 'weather/forecast/:state/:city' => "weather#forecast"
  # http://localhost:3000/weather/conditions/TX/Austin.json?q=temp_f
  match 'weather/conditions/:state/:city' => "weather#conditions"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"
end
