class WhichWidget.Routers.WeathersRouter extends Backbone.Router
  initialize: (options) ->
    @weathers = new WhichWidget.Collections.WeathersCollection()
    @weathers.reset options.weathers

  routes:
    "new"      : "newWeather"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newWeather: ->
    @view = new WhichWidget.Views.Weathers.NewView(collection: @weathers)
    $("#weathers").html(@view.render().el)

  index: ->
    @view = new WhichWidget.Views.Weathers.IndexView(weathers: @weathers)
    $("#weathers").html(@view.render().el)

  show: (id) ->
    weather = @weathers.get(id)

    @view = new WhichWidget.Views.Weathers.ShowView(model: weather)
    $("#weathers").html(@view.render().el)

  edit: (id) ->
    weather = @weathers.get(id)

    @view = new WhichWidget.Views.Weathers.EditView(model: weather)
    $("#weathers").html(@view.render().el)
