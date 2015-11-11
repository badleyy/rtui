define [
  "Route"
], (Route) ->

  class Catchall extends Route

    constructor: () ->
      @path = "*"
      @view = "NotFound"

  Catchall
