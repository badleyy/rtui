define [
], () ->

  class Route

    constuctor: (@path="") ->

    resolve: () ->
      true
