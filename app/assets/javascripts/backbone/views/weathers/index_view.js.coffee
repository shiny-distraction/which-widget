WhichWidget.Views.Weathers ||= {}

class WhichWidget.Views.Weathers.IndexView extends Backbone.View
  template: JST["backbone/templates/weathers/index"]

  initialize: () ->
    @options.weathers.bind('reset', @addAll)
    @options.weathers.bind('change', @theyChanged)

  addAll: () =>
    @options.weathers.each(@addOne)

  addOne: (weather) =>
    view = new WhichWidget.Views.Weathers.WeatherView({model : weather})
    #@$("tbody").remove()
    @$("tbody").append(view.render().el)

  theyChanged: (weather) =>
    alert("One changed! " + weather)

  fetchme: () =>
    @options.weathers.fetch()

  render: =>
    $(@el).html(@template(weathers: @options.weathers.toJSON() ))
    @addAll()

    return this