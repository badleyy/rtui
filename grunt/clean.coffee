path = require "path"
path_config = require "./paths"

module.exports =
  index: path.join path_config.dest, "index.html"
  script: path.join path_config.dest, "js"
  style: path.join path_config.dest, "css"
  vendor: path.join path_config.dest, "vendor"
  temp: path.join path_config.temp
