core = 7.x
api = 2

; Drupal Core
projects[drupal][version] = "7.38"
;; Allow hook_field_schema_alter to be implemented: https://drupal.org/node/691932#comment-8797725
projects[drupal][patch][] = "https://drupal.org/files/issues/field-schema-alter-691932-92.patch"
;; Field attach with aggregation bug
;; https://drupal.org/comment/4984276#comment-4984276
projects[drupal][patch][] = https://drupal.org/files/issues/1161708--_field_invoke-trouble-15.patch

; =====================================
; Libraries
; =====================================

;;
;; Leaflet
;;
libraries[leaflet][download][type] = get
libraries[leaflet][download][url] = http://leaflet-cdn.s3.amazonaws.com/build/leaflet-0.7.1.zip
libraries[leaflet][directory_name] = leaflet
libraries[leaflet][destination] = libraries


; =====================================
; Contrib Modules
; =====================================
; By default, store all contrib modules in the "contrib" subdirectory of the
; modules directory.
defaults[projects][subdir] = "contrib"
projects[libraries] = 2

;;
;; The Basics
;;
projects[bean] = 1.9
projects[ctools][version] = 1.7
projects[devel][versions] = 1.5
projects[diff][version] = 3.2
projects[entity] = 1.6
projects[job_scheduler] = 2.0-alpha3

;;
;; Geocluster
;;
projects[geocluster][download][branch] = "7.x-1.x"
projects[geocluster][download][revision] = "505fc5c"
;; Move geohash to entity presave for better reliability.
;; @see https://www.drupal.org/node/2020737
projects[geocluster][patch][] = https://drupal.org/files/issues/geocluster--geohash-empty-column-data--2020737-8.patch

;;
;; Leaflet
;;
projects[leaflet][download][branch] = "7.x-1.x"
projects[leaflet][download][revision] = "94a9b65"

;;
;; Leaflet GeoJSON
;;
projects[leaflet_geojson][version] = 1.0

;;
;; Views
;;
project[views][version] = 3.11
;; Add hook_views_post_execute_query to views API for Geocluster.
;; @see http://drupal.org/node/1791796
projects[views][patch][] = http://drupal.org/files/views_post_execute_query_hook.patch
;; Add GROUP_CONCAT aggregate function and query extender.
;; @see http://drupal.org/node/1362524
projects[views][patch][] = https://drupal.org/files/issues/1362524-30.views_.group-concat-aggregate.patch
;; Fix "an illegal selection" exposed filter bug
;; @see https://www.drupal.org/node/2292467
projects[views][patch][] = https://www.drupal.org/files/issues/views_fix-illegal-choice-exposed-group-filters_2292467-02.patch

;;
;; Views GeoJSON
;;
projects[views_geojson][download][branch] = "7.x-1.x"
projects[views_geojson][download][revision] = "cc2bc0b"
;; Allow other entities besides nodes to have description field.
;; @see https://drupal.org/node/2082143
projects[views_geojson][patch][] = "https://drupal.org/files/views_geojson-description_property-2082143-1.patch"
;; Add hook views_geojson_render_fields_alter
;; @see http://drupal.org/node/1799870
projects[views_geojson][patch][] = http://drupal.org/files/views_geojson_render_fields_alter.patch
;; Geoofield WKT incompatibility.
;; @see http://drupal.org/node/1794848
projects[views_geojson][patch][] = https://drupal.org/files/1794848-geofield20.patch
;; Bounding box for all views.
;; see http://drupal.org/node/2060197
projects[views_geojson][patch][] = https://drupal.org/files/bbox_on_all_views.patch
;; Bounding argument not exported correctly.
;; @see https://drupal.org/node/1864972
projects[views_geojson][patch][] = https://drupal.org/files/issues/views_geojson--bbox-arg-export--1864972-5.patch


; =====================================
; Demo content
; =====================================
projects[features][version] = 2.5
projects[uuid][version] = 1.0-alpha6
projects[uuid_features][version] = 1.0-alpha4

