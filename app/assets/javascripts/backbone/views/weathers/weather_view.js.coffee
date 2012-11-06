WhichWidget.Views.Weathers ||= {}

class WhichWidget.Views.Weathers.WeatherView extends Backbone.View
  template: JST["backbone/templates/weathers/weather"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
