import 'dart:convert';

import 'package:collection/collection.dart';

/// Gives details for a Category: alias and title.
class Category {
  /// Alias of a category.
  ///
  /// When searching for business in certain categories, use alias rather than the title.
  String? alias;

  /// Title of a category for display purpose.
  String? title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Category();

    return Category(
      alias: map['alias'],
      title: map['title'],
    );
  }

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(alias: $alias, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.alias == alias && other.title == title;
  }

  @override
  int get hashCode => Object.hash(alias, title);
}

/// A list of category title and alias pairs associated with a business.
class Categories {
  final List<Category>? categories;

  Categories({
    this.categories,
  });

  factory Categories.fromList(List<dynamic>? list) {
    if (list == null) return Categories();

    return Categories(
      categories: list.map((x) => Category.fromMap(x)).toList(),
    );
  }

  factory Categories.fromJson(String source) =>
      Categories.fromList(json.decode(source));

  @override
  String toString() => 'Categories(categories: $categories)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Categories && listEquals(other.categories, categories);
  }

  @override
  int get hashCode => Object.hash(super.hashCode, categories);
}
