# Hazdev Web Application Layout

The app structure provides a way to organize web application files,
independent of other applications that may be running on the same server.
Hazdev uses Apache and PHP, but the same principles can be applied to other
platforms and languages.


Note that this application layout refers to the structure that is deployed.
The hazdev-project-skeleton uses a build process so application source code
can be better organized during development, and optimized before deployment.
See [BUILD.md](BUILD.md)

## Organization

Applications are organized into 3 sub-directories:


### Configuration (`conf`)
Configuration files provide environment, and web server configuration.
Typically there are 3 files:

#### `conf/config.ini`
define environment variables like database connections and
other application parameters.

> NOTE: if this file contains sensitive information,
> like hostnames or passwords, it must not be included in a public repository
> (like GitHub) and must be generated during application install
> (see lib/pre-install below).

#### `conf/config.inc.php`
include file used by web addressable content to parse config.ini and make,
application parameters (database connection objects, etc.) available to the
application.

#### `conf/httpd.conf`
web server configuration snippet for the app.

For Apache we use the `Alias` directive to map a URL prefix to the htdocs
directory, the `Location` directive to manage access control, and the
`RewriteRule` directive for any URL manipulation ("pretty URLs").


### Web Accessible Content (`htdocs`)
Files that can be accessed directly, or after URL modifications specified by
Configuration files.  This includes any images, javascripts, or stylesheets
referenced by other files in the application.


### Library Files (`lib`)
Files that are included or used by Web addressable content.

Because web server configuration typically requires absolute filesystem paths,
which are not necessarily known in advance, lifecycle "hook" scripts can be
used to generate configurations dynamically:

#### `lib/pre-install`
configure environment variables and generate configuration files
including `conf/config.ini` and `conf/httpd.conf`

> A configuration framework is defined by the skeleton, and additional
> prompts can be added to the `$PROMPTS` array in `src/lib/configure.php`.

#### `lib/uninstall`
remove any configuration files generated during pre-install.
