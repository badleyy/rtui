path_config = require "./paths"

module.exports =
  debug:
    options:
      port: 8080
      static: path_config.dest
