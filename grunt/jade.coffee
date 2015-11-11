path = require "path"
path_config = require "./paths"

module.exports =
  index_debug:
    options:
      pretty: true
    files: [{
      expand: true
      cwd: path.join path_config.src, "jade"
      src: ["index.jade"]
      ext: ".html"
      dest: path_config.dest
    }]

