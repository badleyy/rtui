path = require "path"
path_config = require "./paths"

module.exports =
  debug:
    options:
      presets: ["es2015"]
      plugins: [
        "transform-react-jsx"
        ["babel-plugin-external-helpers-2", {externalHelpers: false}]
      ]
    files: [{
      src: ["**/*.js", "**/*.jsx"]
      cwd: path.join path_config.src, "script"
      expand: true
      ext: ".js"
      dest: path.join path_config.temp, "js"
    }]
