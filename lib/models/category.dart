import 'dart:convert';

import 'package:collection/collection.dart';

/// Gives details for a Category: alias and title.
class Category {
  /** Alias of a category. When searching for business in certain categories, use alias rather than the title. */
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

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(alias: $alias, title: $title)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Category &&
      o.alias == alias &&
      o.title == title;
  }
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

  factory Categories.fromJson(String source) => Categories.fromList(json.decode(source));

  @override
  String toString() => 'Categories(categories: $categories)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Categories &&
      listEquals(o.categories, categories);
  }
}
