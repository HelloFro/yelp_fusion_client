/// Gives details for each Category alias and title.
class Category {
  /** Alias of a category, when searching for business in certain categories, use alias rather than the title. */
  String alias;

  /// Title of a category for display purpose.
  String title;

  Category({this.alias, this.title});

  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(alias: data['alias'], title: data['title']);
  }
}

/// A list of category title and alias pairs associated with a business.
class Categories {
  List<Category> categories;

  Categories({this.categories});

  factory Categories.fromList(List<dynamic> categoryList) {
    return Categories(
      categories:
          categoryList.map((e) => Category.fromJson(e['categories'])).toList(),
    );
  }
}