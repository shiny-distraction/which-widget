WhichWidget.Views.Weathers ||= {}

class WhichWidget.Views.Weathers.NewView extends Backbone.View
  template: JST["backbone/templates/weathers/new"]

  events:
    "submit #new-weather": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (weather) =>
        @model = weather
        window.location.hash = "/#{@model.id}"

      error: (weather, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
