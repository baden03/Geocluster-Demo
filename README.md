# Geocluster Demo for Drupal 7

![alt tag](https://raw.githubusercontent.com/mpgeek/Geocluster-Demo/master/geocluster-demo-screen-cap.png)

Minimal build spec for demoing the Leaflet-Geocluster stack in Drupal 7. This demo kit is built with [Grunt Drupal Tasks](https://github.com/phase2/grunt-drupal-tasks) via [Gadget](https://github.com/phase2/generator-gadget). Check the documentation at for Grunt Drupal Tasks (GDT) for more about the awesomeness of Drupal automation with Grunt.

# Usage

This kit includes demo content that is generated with `devel_generate`. To spin up the demo, first clone the repo, and change in to the root of the project, then build:

    $ grunt drushmake

Next, you'll need an apache virtual host (or similar) and a database configured for the test content. For the purposes of this example, if you use `d7-gecluster.dev` as your virtual host domain, you can use the scaffolding as-is; point your virtual host to `build/html`. Then [create a database](https://www.drupal.org/documentation/install/create-database) using your preferred method. Now make a copy of the example local settings file:

    $ cd src/sites/d7geocluster.dev
    $ cp settings.local.example.php settings.local.php
    
Note that we used a site directory named after the virtual host domain. Substitute whatever you used in your environment for that directory name. Now edit that file and fill in your database parameters. Now we can scaffold the demo build with the demo database info, install the site and spin up the demo content:

     $ grunt scaffold
     $ drush en geocluster_demo -y
     $ drush en geocluster_demo_content -y

That final command will take a few minutes. Before you try to visit the site, make sure you give `php` enough memory. `512M` works well for the demo, but isn't an absolute minimum. Once that is set restart apache and visit your virtual host. You should see something like the image at the top.
