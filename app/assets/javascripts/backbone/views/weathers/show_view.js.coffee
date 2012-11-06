WhichWidget.Views.Weathers ||= {}

class WhichWidget.Views.Weathers.ShowView extends Backbone.View
  template: JST["backbone/templates/weathers/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
