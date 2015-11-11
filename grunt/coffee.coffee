path = require "path"
path_config = require "./paths"

module.exports =
  debug:
    options:
      bare: true
    files: [{
      expand: true
      dest: path.join path_config.temp, "js"
      src: ["**/*.coffee"]
      ext: ".js"
      cwd: path.join path_config.src, "script"
    }]
