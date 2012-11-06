WhichWidget.Views.Weathers ||= {}

class WhichWidget.Views.Weathers.EditView extends Backbone.View
  template : JST["backbone/templates/weathers/edit"]

  events :
    "submit #edit-weather" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (weather) =>
        @model = weather
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
