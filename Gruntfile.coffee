express = require "express"
path = require "path"
babel = require "babel-core"
sass = require "node-sass"

module.exports = (grunt) ->

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-requirejs"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-babel"

  grunt.initConfig
    jade: require "./grunt/jade"
    clean: require "./grunt/clean"
    watch: require "./grunt/watch"
    serve: require "./grunt/serve"
    concat: require "./grunt/concat"
    babel: require "./grunt/babel"
    coffee: require "./grunt/coffee"
    requirejs: require "./grunt/requirejs"
    sass: require "./grunt/sass"

  grunt.registerMultiTask 'sass', 'compile sass with native node', () ->
    done = this.async true
    is_failed = false
    data = @data
    options = data.options or {}

    sass_config =
      includePaths: options.include or []

    tryFile = (source, dest) ->
      sass_config.file = source

      finished = (err, result) ->
        if(err)
          grunt.log.error err
          done false
        else
          buffer = result.css
          grunt.file.write dest, buffer
          grunt.log.ok "finished"
          done true

      grunt.log.writeln "attempting to render [%s]", source
      sass.render sass_config, finished

    render = (file) ->
      source = file.src
      dest = file.dest

      if source.length != 1 or !grunt.file.exists source[0]
        grunt.log.error "there should only be a single source file for a sass target"
        done false
      else
        tryFile source[0], dest

    if @files.length == 1
      return @files.forEach render

    grunt.log.error "must provide exactly one source file"
    done false

  grunt.registerMultiTask "serve", "launches an express server to use while developing front-end components", () ->
    app = express()
    config_data = @data
    options = config_data.options or {}
    static_dir = options.static or __dirname

    static_middleware = express.static options.static
    index_path = path.join options.static, "index.html"
    grunt.log.writeln "serving application out of #{options.static} using #{index_path}"

    app.use static_middleware

    handler = (req, res) ->
      if /favicon/i.test req.path
        return (res.status 200).send ""

      grunt.log.writeln "responding to #{req.path}"
      res.sendFile index_path

    app.use handler

    app.listen options.port || 8000

  grunt.registerTask 'default', [
    "clean"
    "jade:index_debug"
    "concat:vendors"
    "coffee:debug"
    "babel:debug"
    "requirejs:debug"
    "sass:debug"
  ]

  grunt.registerTask "develop", [
    "default"
    "serve:debug"
    "watch"
  ]
