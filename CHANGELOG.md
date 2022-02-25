# Changelog

## 0.2.0+3

* Bug Fixes
* `fetchBusinessSearch()` should no longer throw
  * `Location.fromMap()`: removed `?? []` that conditionally returned an empty `List<dynamic>` if the `String? crossStreets` was `null`.
* Updated example.md

## 0.2.0+2

* Null Safety + Passing Static Analysis Fixes
* Used pana v0.21.7 to reformat files and pass static analysis
* Added example.md
* Moved `# How to use the Yelp Fusion Client` from README.md `->` example.md

## 0.2.0+1

* Null Safety + Passing Static Analysis
* Override hashCode to every object
* Removed unused import
* Changed `o -> other` to match operator overrides

## 0.2.0-nullsafety

* Null Safety
* Completely reformatted dartdoc comments

```dart
 /** */ -> /// 
```

* Updated pubspec.yaml
* Migrated to Null Saftey using the dart migration tool
* Fixed `fetchBusinessSearch()` required params logical bug

## [0.1.0+1]

* Initial Release Fixes
* Fixed dartdoc comments

```dart
 /** */ -> /// 
```

* Updated `pubspec.yaml`
* Removed using `null` in `if null` operators

## [0.1.0]

* Initial Release
* Comes with Support for Yelp Fusion API Endpoints:
  * `Autocomplete`
  * `Business Details`
  * `Business Reviews`
  * `Business Search`
