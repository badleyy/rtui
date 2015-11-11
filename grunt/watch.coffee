path = require "path"
path_config = require "./paths"

module.exports =
  scripts:
    options: {cwd: path.join path_config.src, "script"}
    files: ["**/*.js", "**/*.jsx", "**/*.coffee"]
    tasks: ["babel:debug", "coffee:debug", "requirejs:debug"]
  jade:
    options: {cwd: path.join path_config.src, "jade"}
    files: ["**/*.jade"]
    tasks: ["jade:index_debug"]
