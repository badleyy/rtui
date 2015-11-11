define [
  "Route"
], (Route) ->

  class Index extends Route

    constructor: () ->
      @path = "/"
      @view = "Index"

    resolve: () ->
      deferred = Q.defer()

      finish = () ->
        deferred.resolve {}

      setTimeout finish, 2000

      deferred.promise

  Index
