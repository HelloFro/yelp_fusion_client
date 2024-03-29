import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:yelp_fusion_client/models/category.dart';
import 'package:yelp_fusion_client/models/coordinates.dart';
import 'package:yelp_fusion_client/models/hours.dart';
import 'package:yelp_fusion_client/models/location.dart';
import 'package:yelp_fusion_client/models/messaging.dart';

/// This endpoint returns detailed business content.
///
/// Note: at this time, the API does not return businesses without any reviews.
class BusinessDetails {
  /// A list of category title and alias pairs associated with this business.
  final Categories? categories;

  /// The coordinates of this business.
  final Coordinates? coordinates;

  /// Phone number of the business formatted nicely to be displayed to users. The format is the standard phone number format for the business's country.
  final String? displayPhone;

  /// Opening hours of the business.
  final HoursList? hours;

  /// Unique Yelp ID of this business.
  ///
  /// ie. '4kMBvIEWPxWkWKFN__8SxQ'
  final String? id;

  /// Unique Yelp alias of this business. Can contain unicode characters.
  ///
  /// ie. 'yelp-san-francisco'.
  final String? alias;

  /// URL of photo for this business.
  final String? imageUrl;

  /// Whether business has been claimed by a business owner
  final bool? isClaimed;

  /// Whether business has been (permanently) closed
  final bool? isClosed;

  /// The location of this business, including address, city, state, zip code and country.
  final Location? location;

  /// Contains Business Messaging / Request a Quote information for this business. Note: This field only appears in the response for businesses that have messaging enabled.
  final Messaging? messaging;

  /// Name of this business.
  final String? name;

  /// Phone number of the business.
  final String? phone;

  /// URLs of up to three photos of the business.
  final List<String>? photos;

  /// Price level of the business ie. $, $$, $$$ or $$$$.
  final String? price;

  /// Rating for this business ie. 1, 1.5, ... 4.5, 5.
  final double? rating;

  /// Number of reviews for this business.
  final int? reviewCount;

  /// URL for business page on Yelp.
  final String? url;

  /// A list of Yelp transactions that the business is registered for. Current supported values are "pickup", "delivery", and "restaurant_reservation".
  final List<String>? transactions;

  /// Out of the ordinary hours for the business that apply on certain dates.
  final SpecialHoursList? specialHours;

  /// A mapping of attribute names ie. "Ambience" or "Good for Kids", to values. Note: This field will only be visible for Fusion VIP clients granted access to certain attributes.
  final Map<String, dynamic>? attributes;

  BusinessDetails({
    this.categories,
    this.coordinates,
    this.displayPhone,
    this.hours,
    this.id,
    this.alias,
    this.imageUrl,
    this.isClaimed,
    this.isClosed,
    this.location,
    this.messaging,
    this.name,
    this.phone,
    this.photos,
    this.price,
    this.rating,
    this.reviewCount,
    this.url,
    this.transactions,
    this.specialHours,
    this.attributes,
  });

  factory BusinessDetails.fromMap(Map<String, dynamic>? map) {
    if (map == null) return BusinessDetails();

    return BusinessDetails(
      categories: Categories.fromList(map['categories']),
      coordinates: Coordinates.fromMap(map['coordinates']),
      displayPhone: map['display_phone'],
      hours: HoursList.fromList(map['hours']),
      id: map['id'],
      alias: map['alias'],
      imageUrl: map['image_url'],
      isClaimed: map['is_claimed'],
      isClosed: map['is_closed'],
      location: Location.fromMap(map['location']),
      messaging: Messaging.fromMap(map['messaging']),
      name: map['name'],
      phone: map['phone'],
      photos: List<String>.from(map['photos']),
      price: map['price'],
      rating: map['rating'],
      reviewCount: map['review_count'],
      url: map['url'],
      transactions: List<String>.from(map['transactions']),
      specialHours: SpecialHoursList.fromList(map['special_hours']),
      attributes: map['attributes'],
    );
  }

  factory BusinessDetails.fromJson(String source) =>
      BusinessDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BusinessDetails(categories: $categories, coordinates: $coordinates, displayPhone: $displayPhone, hours: $hours, id: $id, alias: $alias, imageUrl: $imageUrl, isClaimed: $isClaimed, isClosed: $isClosed, location: $location, messaging: $messaging, name: $name, phone: $phone, photos: $photos, price: $price, rating: $rating, reviewCount: $reviewCount, url: $url, transactions: $transactions, specialHours: $specialHours, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other is BusinessDetails &&
        other.categories == categories &&
        other.coordinates == coordinates &&
        other.displayPhone == displayPhone &&
        other.hours == hours &&
        other.id == id &&
        other.alias == alias &&
        other.imageUrl == imageUrl &&
        other.isClaimed == isClaimed &&
        other.isClosed == isClosed &&
        other.location == location &&
        other.messaging == messaging &&
        other.name == name &&
        other.phone == phone &&
        collectionEquals(other.photos, photos) &&
        other.price == price &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        other.url == url &&
        collectionEquals(other.transactions, transactions) &&
        other.specialHours == specialHours &&
        collectionEquals(other.attributes, attributes);
  }

  /// _Note:_ id is unique per business so id, alias, and name are sufficient for the hashCode
  @override
  int get hashCode => Object.hash(id, alias, name);
}
