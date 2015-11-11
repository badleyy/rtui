path_config = require "./paths"
path = require "path"

module.exports = {
  debug:
    files: [{
      expand: true
      cwd: path.join path_config.src, "sass"
      src: ["app.sass"]
      dest: path.join path_config.dest, "css"
      ext: ".css"
    }]
}
