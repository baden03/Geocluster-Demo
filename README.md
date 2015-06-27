# Geocluster Demo for Drupal 7

![alt tag](https://raw.githubusercontent.com/mpgeek/Geocluster-Demo/master/geocluster-demo-screen-cap.png)

Minimal build spec for demoing the Leaflet-Geocluster stack in Drupal 7.This demo kit is built with [Grunt Drupal Tasks](https://github.com/phase2/grunt-drupal-tasks) via [Gadget](https://github.com/phase2/generator-gadget). Check the documentation at for Grunt Drupal Tasks (GDT) for more about the awesomeness of Drupal automation with Grunt.

## Requirements

### Composer
There are non-Drupal, third party libraires in use in the GDT architecture that can be built easily with `composer`. If you don't have `composer` on your system, you can install it locally into the project with the following command:

    $ curl -sS https://getcomposer.org/installer | php
    
A global installation is probably more useful long terms. [See the `composer` global installation instructions](https://getcomposer.org/doc/00-intro.md#globally) for more on that. 

### Node.js (v0.10.0 or better) 
Use a either
[package manager](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manage)
like `apt-get`, `brew`, or `yum` or a [standalone installer](http://nodejs.org/download/).

### Grunt
After Node.js, you'll need the [`grunt-cli`](https://github.com/gruntjs/grunt-cli), the Grunt command line interface. Get Grunt CLI by running:

    $ npm install -g grunt-cli
    
## Usage

First clone the repo, and change in to the root of the project. Build the dependencies and the initial Drupal build:

    $ composer install
    $ npm install
    $ grunt drushmake
    
Next, you'll need an apache virtual host (or similar) and a database configured for the test content. For the purposes of this example, if you use `d7-gecluster.dev` as your virtual host domain, you can use the scaffolding as-is; point your virtual host to `build/html`. 

Then [create a database](https://www.drupal.org/documentation/install/create-database) using your preferred method. Now make a copy of the example local settings file:

    $ cd PROJECT_ROOT/src/sites/d7geocluster.dev
    $ cp settings.local.example.php settings.local.php
    
Where `PROJECT_ROOT` is the path to the root of the project you cloned.

Note that we used a site directory named after the virtual host domain. Substitute whatever you used in your environment for that directory name. Now edit that file and fill in your database parameters.

Next move the environment scaffolding into the demo build, and spin up the demo content:

     $ grunt scaffold
     $ cd PROJECT_ROOT/build/html/sites/d7-gecluster.dev
     $ drush site-install -y
     $ drush en geocluster_demo -y
     $ drush en geocluster_demo_content -y

That final command will take a few minutes. Before you try to visit the site, make sure you give `php` enough memory. `512M` works well for the demo, but isn't an absolute minimum. Once that is set restart apache and visit your virtual host. You should see something like the image at the top.
