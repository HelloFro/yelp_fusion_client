import 'dart:convert';

import 'package:collection/collection.dart';

/// This endpoint returns up to three review excerpts for a given business ordered by Yelp's default sort order.
///
/// Note: at this time, the API does not return businesses without any reviews.
class BusinessReviews {
  /// The total number of reviews that the business has.
  final int? total;

  /// A list of languages for which the business has at least one review.
  final List<String>? possibleLanguages;

  /// A list of up to three reviews of this business.
  final List<Review>? reviews;

  BusinessReviews({
    this.total,
    this.possibleLanguages,
    this.reviews,
  });

  factory BusinessReviews.fromMap(Map<String, dynamic>? map) {
    if (map == null) return BusinessReviews();

    return BusinessReviews(
      total: map['total'],
      possibleLanguages: List<String>.from(map['possible_languages']),
      reviews: (map['reviews'] as List).map((x) => Review.fromMap(x)).toList(),
    );
  }

  factory BusinessReviews.fromJson(String source) =>
      BusinessReviews.fromMap(json.decode(source));

  @override
  String toString() =>
      'BusinessReviews(total: $total, possibleLanguages: $possibleLanguages, reviews: $reviews)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is BusinessReviews &&
        other.total == total &&
        listEquals(other.possibleLanguages, possibleLanguages) &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode => Object.hash(total, possibleLanguages, reviews);
}

/// A reviews of a business.
class Review {
  /// A unique identifier for this review.
  final String? id;

  /// Text excerpt of this review.
  final String? text;

  /// URL of this review.
  final String? url;

  /// Rating of this review.
  final int? rating;

  /// The time that the review was created in PST.
  final String? timeCreated;

  /// The user who wrote the review.
  final User? user;

  Review({
    this.id,
    this.text,
    this.url,
    this.rating,
    this.timeCreated,
    this.user,
  });

  factory Review.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Review();

    return Review(
      id: map['id'],
      text: map['text'],
      url: map['url'],
      rating: map['rating'],
      timeCreated: map['time_created'],
      user: User.fromMap(map['user']),
    );
  }

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Review(id: $id, text: $text, url: $url, rating: $rating, timeCreated: $timeCreated, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Review &&
        other.id == id &&
        other.text == text &&
        other.url == url &&
        other.rating == rating &&
        other.timeCreated == timeCreated &&
        other.user == user;
  }

  @override
  int get hashCode => Object.hash(id, text, url, rating, timeCreated, user);
}

/// The User Who created a review
class User {
  /// Yelp ID of the user.
  final String? id;

  /// URL of the user's Yelp profile.
  final String? profileUrl;

  /// User screen name ie. first name and first initial of last name.
  final String? name;

  /// URL of the user's profile photo.
  final String? imageUrl;

  User({
    this.id,
    this.profileUrl,
    this.name,
    this.imageUrl,
  });

  factory User.fromMap(Map<String, dynamic>? map) {
    if (map == null) return User();

    return User(
      id: map['id'],
      profileUrl: map['profile_url'],
      name: map['name'],
      imageUrl: map['image_url'],
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, profileUrl: $profileUrl, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.profileUrl == profileUrl &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => Object.hash(id, profileUrl, name, imageUrl);
}
