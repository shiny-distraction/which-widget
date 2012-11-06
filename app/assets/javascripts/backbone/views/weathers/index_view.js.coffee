WhichWidget.Views.Weathers ||= {}

class WhichWidget.Views.Weathers.IndexView extends Backbone.View
  template: JST["backbone/templates/weathers/index"]

  initialize: () ->
    @options.weathers.bind('reset', @addAll)

  addAll: () =>
    @options.weathers.each(@addOne)

  addOne: (weather) =>
    view = new WhichWidget.Views.Weathers.WeatherView({model : weather})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(weathers: @options.weathers.toJSON() ))
    @addAll()

    return this
