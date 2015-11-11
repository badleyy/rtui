path = require "path"

path_config =
  root: path.join __dirname, ".."

path_config.src = path.join path_config.root, "src"
path_config.dest = path.join path_config.root, "dist"
path_config.temp = path.join path_config.root, "tmp"
path_config.vendors = path.join path_config.root, "bower_components"

module.exports = path_config
