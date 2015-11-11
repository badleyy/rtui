path = require "path"
babel = require "babel-core"
path_config = require "./paths"

vendorLib = (file_path) ->
  path.join path_config.vendors, file_path

module.exports =
  vendors:
    options:
      footer: babel.buildExternalHelpers()
    src: [
      vendorLib "q/q.js"
      vendorLib "page/page.js"
      vendorLib "react/react.js"
      vendorLib "react/react-dom.js"
      vendorLib "sizzle/dist/sizzle.js"
      vendorLib "requirejs/require.js"
    ]
    dest: path.join path_config.dest, "vendor/bundle.js"
