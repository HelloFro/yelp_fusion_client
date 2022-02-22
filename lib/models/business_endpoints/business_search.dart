import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:yelp_fusion_client/models/category.dart';
import 'package:yelp_fusion_client/models/coordinates.dart';
import 'package:yelp_fusion_client/models/location.dart';

/** Use Business Search endpoint when you have general info on the biz like name & location but don't know the address. */
class BusinessSearch {
  /// Total number of business
  final int? total;

  /// List of business Yelp finds based on the search criteria.
  final BusinessesSearched? businesses;

  /// Suggested area in a map to display results in.
  final Region? region;

  BusinessSearch({
    this.total,
    this.businesses,
    this.region,
  });

  factory BusinessSearch.fromMap(Map<String, dynamic>? map) {
    if (map == null) return BusinessSearch();
  
    return BusinessSearch(
      total: map['total'],
      businesses: BusinessesSearched.fromList(map['businesses']),
      region: Region.fromMap(map['region']),
    );
  }

  factory BusinessSearch.fromJson(String source) => BusinessSearch.fromMap(json.decode(source));

  @override
  String toString() => 'BusinessSearch(total: $total, businesses: $businesses, region: $region)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is BusinessSearch &&
      o.total == total &&
      o.businesses == businesses &&
      o.region == region;
  }
}

/// Business Yelp found based on the search criteria.
class BusinessSearched {
  /// List of category title and alias pairs associated with this business.
  final Categories? categories;

  /// Coordinates of this business.
  final Coordinates? coordinates;

  /// Phone number of the business formatted nicely to be displayed to users.
  final String? displayPhone;

  /// Distance in meters from the search location. Note: meters regardless of the locale.
  final double? distance;

  /// Unique Yelp ID of this business, ie. '4kMBvIEWPxWkWKFN__8SxQ'
  final String? id;

  /// Unique Yelp alias of this business. Can contain unicode characters. ie. 'yelp-san-francisco'
  final String? alias;

  /// URL of photo for this business.
  final String? imageUrl;

  /// Location of this business, including address, city, state, zip code and country.
  final Location? location;

  /// Name of this business.
  final String? name;

  /// Phone number of the business.
  final String? phone;

  /// Price level of the business, ie. $, $$, $$$ or $$$$.
  final String? price;

  /// Rating for this business, ie. 1, 1.5, ... 4.5, 5.
  final double? rating;

  /// Number of reviews for this business.
  final int? reviewCount;

  /// URL for business page on Yelp.
  final String? url;

  /// List of Yelp transactions that the business is registered for. ie. pickup, delivery, or restaurant_reservation.
  final List<String>? transactions;

  BusinessSearched({
    this.categories,
    this.coordinates,
    this.displayPhone,
    this.distance,
    this.id,
    this.alias,
    this.imageUrl,
    this.location,
    this.name,
    this.phone,
    this.price,
    this.rating,
    this.reviewCount,
    this.url,
    this.transactions,
  });

  factory BusinessSearched.fromMap(Map<String, dynamic>? map) {
    if (map == null) return BusinessSearched();
  
    return BusinessSearched(
      categories: Categories.fromList(map['categories']),
      coordinates: Coordinates.fromMap(map['coordinates']),
      displayPhone: map['displayPhone'],
      distance: map['distance'],
      id: map['id'],
      alias: map['alias'],
      imageUrl: map['imageUrl'],
      location: Location.fromMap(map['location']),
      name: map['name'],
      phone: map['phone'],
      price: map['price'],
      rating: map['rating'],
      reviewCount: map['reviewCount'],
      url: map['url'],
      transactions: List<String>.from(map['transactions']) ?? [],
    );
  }

  factory BusinessSearched.fromJson(String source) => BusinessSearched.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BusinessSearched(categories: $categories, coordinates: $coordinates, displayPhone: $displayPhone, distance: $distance, id: $id, alias: $alias, imageUrl: $imageUrl, location: $location, name: $name, phone: $phone, price: $price, rating: $rating, reviewCount: $reviewCount, url: $url, transactions: $transactions)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is BusinessSearched &&
      o.categories == categories &&
      o.coordinates == coordinates &&
      o.displayPhone == displayPhone &&
      o.distance == distance &&
      o.id == id &&
      o.alias == alias &&
      o.imageUrl == imageUrl &&
      o.location == location &&
      o.name == name &&
      o.phone == phone &&
      o.price == price &&
      o.rating == rating &&
      o.reviewCount == reviewCount &&
      o.url == url &&
      listEquals(o.transactions, transactions);
  }
}

/// List of business Yelp finds based on the search criteria.
class BusinessesSearched {

  final List<BusinessSearched>? businesses;

  BusinessesSearched({
    this.businesses,
  });

  factory BusinessesSearched.fromList(List<dynamic>? list) {
    if (list == null) return BusinessesSearched();
  
    return BusinessesSearched(
      businesses: list.map((x) => BusinessSearched.fromMap(x)).toList(),
    );
  }

  factory BusinessesSearched.fromJson(String source) => BusinessesSearched.fromList(json.decode(source));

  @override
  String toString() => 'BusinessesSearched(businesses: $businesses)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is BusinessesSearched &&
      listEquals(o.businesses, businesses);
  }
}

/// Suggested area in a map to display results in.
class Region {
  /// Center position of map area.
  final Coordinates? center;

  Region({
    this.center,
  });

  factory Region.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Region();
  
    return Region(
      center: Coordinates.fromMap(map['center']),
    );
  }

  factory Region.fromJson(String source) => Region.fromMap(json.decode(source));

  @override
  String toString() => 'Region(center: $center)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Region &&
      o.center == center;
  }
}
