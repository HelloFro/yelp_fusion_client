import 'dart:convert';

/// Gives details for each Category alias and title.
class Category {
  /** Alias of a category. When searching for business in certain categories, use alias rather than the title. */
  String alias;

  /// Title of a category for display purpose.
  String title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
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