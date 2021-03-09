import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:yelp_fusion_client/models/category.dart';

class Autocomplete {

  final Businesses businesses;
  final Categories categories;
  final Terms terms;

  Autocomplete({
    this.businesses,
    this.categories,
    this.terms,
  });

  factory Autocomplete.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Autocomplete(
      businesses: Businesses.fromList(map['businesses']),
      categories: Categories.fromList(map['categories']),
      terms: Terms.fromList(map['terms']),
    );
  }

  factory Autocomplete.fromJson(String source) => Autocomplete.fromMap(json.decode(source));

  @override
  String toString() => 'Autocomplete(businesses: $businesses, categories: $categories, terms: $terms)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Autocomplete &&
      o.businesses == businesses &&
      o.categories == categories &&
      o.terms == terms;
  }
}

class Business {

  final String name;

  final String id;

  Business({
    this.name,
    this.id,
  });

  factory Business.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Business(
      name: map['name'],
      id: map['id'],
    );
  }

  factory Business.fromJson(String source) => Business.fromMap(json.decode(source));

  @override
  String toString() => 'Business(name: $name, id: $id)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Business &&
      o.name == name &&
      o.id == id;
  }
}

class Businesses {

  final List<Business> businesses;

  Businesses({
    this.businesses,
  });

  factory Businesses.fromList(List<dynamic> list) {
    if (list == null) return null;
  
    return Businesses(
      businesses: list.map((x) => Business.fromMap(x)).toList(),
    );
  }

  factory Businesses.fromJson(String source) => Businesses.fromList(json.decode(source));

  @override
  String toString() => 'Businesses(businesses: $businesses)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Businesses &&
      listEquals(o.businesses, businesses);
  }
}

class Terms {

  final List<dynamic> text;

  Terms({
    this.text,
  });

  factory Terms.fromList(List<dynamic> list) {
    if (list == null) return null;
  
    return Terms(
      text: list.map((x) => x['text']).toList(),
    );
  }

  factory Terms.fromJson(String source) => Terms.fromList(json.decode(source));

  @override
  String toString() => 'Terms(text: $text)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Terms &&
      listEquals(o.text, text);
  }
}
