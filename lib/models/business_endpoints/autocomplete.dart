import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:yelp_fusion_client/models/category.dart';

class Autocomplete {
  final BusinessesAutocompleted? businesses;
  final Categories? categories;
  final Terms? terms;

  Autocomplete({
    this.businesses,
    this.categories,
    this.terms,
  });

  factory Autocomplete.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Autocomplete();

    return Autocomplete(
      businesses: BusinessesAutocompleted.fromList(map['businesses']),
      categories: Categories.fromList(map['categories']),
      terms: Terms.fromList(map['terms']),
    );
  }

  factory Autocomplete.fromJson(String source) =>
      Autocomplete.fromMap(json.decode(source));

  @override
  String toString() =>
      'Autocomplete(businesses: $businesses, categories: $categories, terms: $terms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Autocomplete &&
        other.businesses == businesses &&
        other.categories == categories &&
        other.terms == terms;
  }

  @override
  int get hashCode => Object.hash(businesses, categories, terms);
}

class BusinessAutocompleted {
  final String? name;
  final String? id;

  BusinessAutocompleted({
    this.name,
    this.id,
  });

  factory BusinessAutocompleted.fromMap(Map<String, dynamic>? map) {
    if (map == null) return BusinessAutocompleted();

    return BusinessAutocompleted(
      name: map['name'],
      id: map['id'],
    );
  }

  factory BusinessAutocompleted.fromJson(String source) =>
      BusinessAutocompleted.fromMap(json.decode(source));

  @override
  String toString() => 'Business(name: $name, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BusinessAutocompleted &&
        other.name == name &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(name, id);
}

class BusinessesAutocompleted {
  final List<BusinessAutocompleted>? businesses;

  BusinessesAutocompleted({
    this.businesses,
  });

  factory BusinessesAutocompleted.fromList(List<dynamic>? list) {
    if (list == null) return BusinessesAutocompleted();

    return BusinessesAutocompleted(
      businesses: list.map((x) => BusinessAutocompleted.fromMap(x)).toList(),
    );
  }

  factory BusinessesAutocompleted.fromJson(String source) =>
      BusinessesAutocompleted.fromList(json.decode(source));

  @override
  String toString() => 'Businesses(businesses: $businesses)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is BusinessesAutocompleted &&
        listEquals(other.businesses, businesses);
  }

  @override
  int get hashCode => Object.hash(super.hashCode, businesses);
}

class Terms {
  final List<dynamic>? text;

  Terms({
    this.text,
  });

  factory Terms.fromList(List<dynamic>? list) {
    if (list == null) return Terms();

    return Terms(
      text: list.map((x) => x['text']).toList(),
    );
  }

  factory Terms.fromJson(String source) => Terms.fromList(json.decode(source));

  @override
  String toString() => 'Terms(text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Terms && listEquals(other.text, text);
  }

  @override
  int get hashCode => Object.hash(super.hashCode, text);
}
