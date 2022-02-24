# [0.2.0+2] - Null Safety + Passing Static Analysis (23 February 2022)

* Used pana v0.21.7 to reformat files and pass static analysis
* Added example.md
* Moved `# How to use the Yelp Fusion Client` from README.md `->` example.md

## [0.2.0+1] - Null Safety + Passing Static Analysis (23 February 2022)

* Override hashCode to every object
* removed unused import
* changed ```o -> other``` to match operator overrides

## [0.2.0] - Null Safety (22 February 2022)

* Fixed dartdoc comments

```dart
 /** */ -> /// 
```

* Updated pubspec.yaml
* Migrated to Null Saftey using the dart migration tool
* Fixed fetchBusinessSearch() required params logical bug

## [0.1.0+1] - Initial Release Fixes (9 March 2021)

* Fixed dartdoc comments

```dart
 /** */ -> /// 
```

* Updated pubspec.yaml
* Removed using `null` in `if null` operators

## [0.1.0] - Initial Release (9 March 2021)

* Comes with Support for Yelp Fusion API Endpoints: `Autocomplete`, `Business Details`, `Business Reviews`, and `Business Search`
