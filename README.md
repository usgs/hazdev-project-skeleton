hazdev-project-skeleton
==============

Project skeleton for hazdev web applications.


Introduction
------------

- [Read APP.md](./APP.md)
  for more information about the Hazdev Web Application Layout
- [Read BUILD.md](./BUILD.md)
  for more information about the Hazdev Web Application Build Framework


Generating a new Project
------------------------

- Download ZIP of current repository (button to the right of URLs)
- extract and rename folder to `new-project`
- update package.json, README.md with `new-project` name
- set default MOUNT_PATH in src/lib/configure.inc.php
- import into new repository


Dependencies
------------
- node v4.2.4
> [Node Version Manager (NVM)](https://github.com/creationix/nvm)
> simplifies installation.

- php v5.6


Using the Generated Project
---------------------------

## Getting Started
- run `npm install` to install application development dependencies
- configure the application
- run `grunt` from the install directory

## Configuration
- run `src/lib/pre-install` to setup config.ini
- configuration options are defined in `src/lib/configure.inc.php`
- `MOUNT_PATH` is the base url for the application

## CSS
- SCSS files (`*.scss`, `!_*.scss`) in the `src/htdocs/css` directory are compiled.

- Path is configured in `gruntconfig/config.js`:
```
cssPath: [
  'src/htdocs/css',
  'node_modules/hazdev-webutils/src'
]
```

## JS
- JS files (`*.js`) in the `src/htdocs/js` directory are compiled.

- Path is configured in `gruntconfig/config.js`:
```
jsPath: {
  // DIRECTORY: EXPORT_PATTERN,

  # export all files in these directories in htdocs/js/bundle.js
  # for use in testing
  'src/htdocs/js': '*/*.js',
  'node_modules/hazdev-webutils/src': '**/*.js',

  # add to path, but don't export
  'node_modules/other-module/dist': null
}
```

## Docker

### Building a container

From root of project, run:
    ```
    docker build -t project-skeleton:version .
    ```

### Running container

- Run the container using the tag
    ```
    docker run -it -p 8000:8881 project-skeleton:version
    ```

- Connect to running container in browser
    ```
    docker-machine env default \
        | grep HOST \
        | sed s/.*tcp/http/g \
        | awk -F: '{print $1":"$2":8000"}' \
        | xargs open
    ```
