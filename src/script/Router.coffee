define [
  "services/Auth"
], (Auth) ->

  VIEW_PATH = "views"
  CONTAINER_SELECTOR = "[rt-view]"

  engine = window.page
  routes = []
  active_view = null

  Router = {}

  Router.register = (route) ->
    view_container = (Sizzle CONTAINER_SELECTOR)[0]
    instance = new route()
    view_path = [VIEW_PATH, instance.view].join "/"
    route_context = null
    resolved_data = null

    render = (view_component) ->
      active_view = React.createElement view_component, resolved_data
      ReactDOM.render active_view, view_container

    finish = (data) ->
      resolved_data = data
      require [view_path], render

    fail = (error) ->
      engine.redirect "/error"

    prepped = () ->
      resolution = instance.resolve route_context

      if resolution.then and (typeof resolution.then) == "function"
        return (resolution.then finish).catch fail

      finish resolution

    before = (ctx, next) ->
      route_context = ctx
      Auth.prep prepped

    routes.push instance
    engine instance.path, before

  Router.start = () ->
    engine.start()

  Router
