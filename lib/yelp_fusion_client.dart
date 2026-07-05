library yelp_fusion_client;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yelp_fusion_client/models/business_endpoints/autocomplete.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_details.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_reviews.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_search.dart';

/// A Dart class to get all the endpoints of the Yelp Fusion API.
class YelpFusion {
  /// Yelp Fusion API Key
  String apiKey;

  /// Host authority the requests are sent to. `Default=api.yelp.com.`
  ///
  /// The Yelp Fusion API does not send CORS headers, so browsers block
  /// direct requests from web apps (e.g. Flutter Web). Set this to your
  /// own CORS proxy that forwards requests to `api.yelp.com`.
  String baseUrl;

  /// Headers for Authorization and Content Request Type
  Map<String, String>? _headers;

  /// **Requires** API Key. Sets GET request headers.
  YelpFusion({required this.apiKey, this.baseUrl = 'api.yelp.com'}) {
    _headers = {
      'Authorization': 'Bearer $apiKey',
      "Content-type": "application/json",
    };
  }

  /// Get autocomplete suggestions for search keywords, businesses and categories, based on the input text.
  ///
  /// text: **Required.** Text to get autocomplete suggestions for.
  ///
  /// latitude: **Required.**
  ///
  /// longitude: **Required.**
  ///
  /// locale: Optional. `Default=en_US.`
  Future fetchAutocomplete(
      {required String text,
      required double latitude,
      required double longitude,
      String locale = "en_US",
      bool asObject = true}) async {
    var params = {
      'text': text,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'locale': locale,
    };

    var url = Uri.https(baseUrl, 'v3/autocomplete', params);

    final response = await http.get(url, headers: _headers);

    Map<String, dynamic> jsonData = json.decode(response.body);

    if (jsonData.containsKey('error')) {
      return jsonData['error'];
    } else {
      return asObject ? Autocomplete.fromJson(response.body) : jsonData;
    }
  }

  /// Get rich business data, such as name, address, phone number, photos, Yelp rating, price levels and hours of operation.
  ///
  /// id: **Required.** Business id or alias.
  ///
  /// locale: Optional. `Default=en_US.`
  Future fetchBusinessDetails(
      {required String id,
      String locale = "en_US",
      bool asObject = true}) async {
    var params = {
      'locale': locale,
    };

    var url = Uri.https(baseUrl, 'v3/businesses/$id', params);

    final response = await http.get(url, headers: _headers);

    Map<String, dynamic> jsonData = json.decode(response.body);

    if (jsonData.containsKey('error')) {
      return jsonData['error'];
    } else {
      return asObject ? BusinessDetails.fromJson(response.body) : jsonData;
    }
  }

  /// Get up to three review excerpts, the URL to the full review, the Yelp rating with each review excerpt as well as the name and profile photo of the reviewer.
  ///
  /// id: **Required.** Business id or alias.
  ///
  /// locale: Optional. `Default=en_US.`
  ///
  /// limit: Optional. Number of reviews to get.
  ///
  /// offset: Optional. Offset the list of returned reviews by this amount.
  ///
  /// sortBy: Optional. Sorting algorithm, ie. yelp_sort or newest.
  Future fetchBusinessReviews(
      {required String id,
      String locale = "en_US",
      int? limit,
      int? offset,
      String? sortBy,
      bool asObject = true}) async {
    var params = {
      'locale': locale,
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (sortBy != null) 'sort_by': sortBy,
    };

    var url = Uri.https(baseUrl, 'v3/businesses/$id/reviews', params);

    final response = await http.get(url, headers: _headers);

    Map<String, dynamic> jsonData = json.decode(response.body);

    if (jsonData.containsKey('error')) {
      return jsonData['error'];
    } else {
      return asObject ? BusinessReviews.fromJson(response.body) : jsonData;
    }
  }

  /// Get up to 1000 businesses based on the provided search criteria.
  ///
  /// term: Optional. Search term, ie. "food" or "restaurants".
  ///
  /// location: Required if either latitude or longitude is not provided.
  ///
  /// `ie. "New York City", "NYC", "350 5th Ave, New York, NY 10118".`
  ///
  /// latitude: Required if location is not provided.
  ///
  /// longitude: Required if location is not provided.
  ///
  /// radius: Optional. A suggested search radius in meters.
  ///
  /// categories: Optional. Categories to filter the search results with.
  ///
  /// locale: Optional. `Default=en_US.`
  ///
  /// limit: Optional. Number of business results to get. `Default=20.`
  ///
  /// offset: Optional.
  /// Offset the list of returned business results by this amount.
  ///
  /// sortBy: Optional.
  /// Suggestion to the search algorithm that the results be sorted by,
  ///
  /// ie. best_match, rating, review_count or distance. `Default=best_match.`
  ///
  /// price: Optional.
  /// Pricing levels to filter the search result ie. 1 = $, 2 = $$, 3 = $$$, 4 = $$$$.
  ///
  /// openNow: Optional.
  /// Only get the businesses open now. `Default=false.`
  ///
  /// openAt: Optional.
  /// An integer representing the Unix time in the same timezone of the search location.
  ///
  /// **Note: openAt and openNow cannot be used together.**
  ///
  /// attributes: Optional.
  /// Additional filters to get specific search results.
  ///
  /// devicePlatform: Optional.
  /// Platform to use for the mobile_link property, ie. android, ios or mobile-generic.
  ///
  /// reservationDate: Optional.
  /// Date to find businesses with reservation openings for, in YYYY-mm-dd format.
  ///
  /// reservationTime: Optional.
  /// Time to find businesses with reservation openings for, in HH:MM format.
  ///
  /// reservationCovers: Optional.
  /// Number of people the reservation is for, ie. 1 to 10.
  ///
  /// matchesPartySizeParam: Optional.
  /// Whether to filter out results that don't have openings matching the reservation params.
  Future fetchBusinessSearch(
      {String? term,
      String? location,
      double? latitude,
      double? longitude,
      int? radius,
      String? categories,
      String? locale,
      int? limit,
      int? offset,
      String? sortBy,
      String? price,
      bool? openNow,
      int? openAt,
      String? attributes,
      String? devicePlatform,
      String? reservationDate,
      String? reservationTime,
      int? reservationCovers,
      bool? matchesPartySizeParam,
      bool asObject = true}) async {
    assert(latitude != null && longitude != null && location == null ||
        location != null && latitude == null && longitude == null);

    var params = {
      if (term != null) 'term': term,
      if (latitude == null && longitude == null) 'location': location,
      if (location == null) 'latitude': latitude.toString(),
      if (location == null) 'longitude': longitude.toString(),
      if (radius != null) 'radius': radius.toString(),
      if (categories != null) 'categories': categories,
      if (locale != null) 'locale': locale,
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (sortBy != null) 'sort_by': sortBy,
      if (price != null) 'price': price,
      if (openNow != null) 'open_now': openNow.toString(),
      if (openAt != null) 'open_at': openAt.toString(),
      if (attributes != null) 'attributes': attributes,
      if (devicePlatform != null) 'device_platform': devicePlatform,
      if (reservationDate != null) 'reservation_date': reservationDate,
      if (reservationTime != null) 'reservation_time': reservationTime,
      if (reservationCovers != null)
        'reservation_covers': reservationCovers.toString(),
      if (matchesPartySizeParam != null)
        'matches_party_size_param': matchesPartySizeParam.toString(),
    };

    var url = Uri.https(baseUrl, 'v3/businesses/search', params);

    final response = await http.get(url, headers: _headers);

    Map<String, dynamic> jsonData = json.decode(response.body);

    if (jsonData.containsKey('error')) {
      return jsonData['error'];
    } else {
      return asObject ? BusinessSearch.fromJson(response.body) : jsonData;
    }
  }
}
