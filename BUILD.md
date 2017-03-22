# Hazdev Web Application Build Framework

The project skeleton uses `grunt` ( https://gruntjs.com/ ), and several grunt
plugins to build a web application from source.
This allows the code to be better organized during development,
and optimized for better performance before deployment.


## Overview

Source files are managed in the `src` folder, and follow
[Hazdev Web Application Layout](APP.md) guidelines.

Running the default grunt task ( `grunt` ) builds the web application
from source whenever it starts or detects changes to source files.
The generated files are stored in a `.build` directory, and a development
web server previews the application.

A separate distribution grunt target ( `grunt dist` ) is used to optimize
the generated application files.  The optimized files are stored in a `dist`
directory, and a development web server previews the optimized application.


## Plugins

- Browserify (http://browserify.org/)
	
	compile, and transpile new ES6 features like Promises, javascript files.

- Connect/Express

	run a development web server

- Eslint

	check javascript coding standards

- Mocha/PhantomJS

	run javascript unit tests

- Postcss (http://postcss.org/) with
	Precss (https://github.com/jonathantneal/precss)

	compile SCSS files.

- Uglify

	minify Javascript


## Configuration

Grunt configuration is managed in `Gruntfile.js`, and `gruntconfig/*.js`.


## Javascript

Javascript files found in `src/htdocs/js` are considered "entry points", and
are compiled by Browserify.  Classes should be defined in sub folders within
the js folder, and can be included into an entrypoint.


## CSS

SCSS files found in `src/htdocs/css` are compiled by Postcss/Precss.
Files intended to be included, but not separately compiled, should be named
using a leading underscore.