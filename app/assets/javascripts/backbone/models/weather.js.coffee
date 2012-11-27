class WhichWidget.Models.Weather extends Backbone.Model
  paramRoot: 'weather'
  url: '/weather'

  defaults:
    current_temp_f: null
    wind_speed: null

class WhichWidget.Collections.WeathersCollection extends Backbone.Collection
  model: WhichWidget.Models.Weather
  url: '/weather'
