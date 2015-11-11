define [
  "Router"
  "components/Header"
  "routes"
], (Router, Header, routes) ->

  HEADER_SELECTOR = "[rt-header]"
  FOOTER_SELECTOR = "[rt-footer]"

  Router.register r for r in routes

  header = React.createElement Header, {}
  container = (Sizzle HEADER_SELECTOR)[0]
  ReactDOM.render header, container

  Router.start()
