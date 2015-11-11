define [
  "Route"
], (Route) ->

  class ErrorRoute extends Route

    constructor: () ->
      @path = "/error"
      @view = "Error"

  ErrorRoute
