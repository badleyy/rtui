path = require "path"
path_config = require "./paths"

module.exports =
  debug:
    options:
      appDir: path.join path_config.root, "tmp", "js"
      baseUrl: "./"
      modules: [{
        name: "app"
      }]
      dir: path.join path_config.dest, "js"
      removeCombined: true
      optimize: "none"
