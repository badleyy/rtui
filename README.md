# RTUI

The browser side application for the raft raffle platform, responsible for the web interface and communicating with the [rtapi](https://github.com/badleyy/rtapi). The application consists of static assets, intended to be served from an *isolated* server, even a cdn if possible.

## Contributing

To get started working on this part of the platform, you will need a machine with [node](https://nodejs.org) installed, which is the runtime responsible for compiling the assets to be served under a static asset server. Installing node is relatively straightforward and there are [installers](https://nodejs.org/en/download/) provided for various systems.


Once `node` and `npm` are installed, it is encouraged to install [bower](http://bower.io/) and [grunt](http://gruntjs.com/) globally:

```
$ sudo npm i grunt-cli -g
$ sudo npm i bower -g
```

These are both node cli interfaces that are used during the browser-side compilation.

### Compiling

All of the codebase's compilation tasks are defined in the [Gruntfile](https://github.com/badleyy/rtui/blob/master/Gruntfile.coffee). Each one of these tasks has *targets* which are defined in a file named after the task in the `grunt` directory. For example, compiling the application's [sass](http://sass-lang.com/) files can be accomplished by running: `grunt sass:debug`. This will generate the compiled `dist/css/app.css` file. To run the complete build, simply running:

```
$ grunt
```

will create the `dist` direcory and everything needed to host the application on a server.

While developing, a `develop` grunt task has been created that launches an [express](http://expressjs.com/) server running on poert 8080. So, after running `grunt develop`, you should be able to navigate to `http://localhost:8080` to see the application running.
