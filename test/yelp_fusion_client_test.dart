import 'package:test/test.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_search.dart';
import 'package:yelp_fusion_client/yelp_fusion_client.dart';

import 'env/env.dart';

void main() {
  final api = YelpFusion(apiKey: Env.api_key);

  group('fetchBusinessDetails', () {
    test('Business Details ARE Fetched by Business alias/id', () async {
      var details = await api.fetchBusinessDetails(id: 'north-india-restaurant-san-francisco-7');

      expect(details.alias, 'north-india-restaurant-san-francisco-7');
    });

    test('Business Details ARE NOT Fetched by Business alias/id and error code is returned', () async {
      var details = await api.fetchBusinessDetails(id: 'DNE');

      expect(details['code'], 'BUSINESS_NOT_FOUND');
    });
  });

  group('fetchAutocomplete', () {
    test('Autocomplete IS Fetched by user text based on lat & long', () async {
      var autocomplete = await api.fetchAutocomplete(text: 'del', latitude: 37.786882, longitude: -122.399972);

      expect(autocomplete.terms.text.first, 'Delivery');
    });
  });

  group('fetchBusinessSearch', () {
    test('BusinessSearch IS Fetched by term based on lat & long AND first business MATCHES expected alias', () async {
      var search = await api.fetchBusinessSearch(term: 'delis', latitude: 37.786882, longitude: -122.399972, limit: 1);

      expect(search.businesses.businesses.first.alias, "molinari-delicatessen-san-francisco");
    });

    test('BusinessSearch IS Fetched by term based on lat & long AND returns at least one business', () async {
      var search = await api.fetchBusinessSearch(term: 'delis', latitude: 37.786882, longitude: -122.399972, limit: 2);

      expect(search.total, greaterThan(0));
    });

    test('BusinessSearch IS Fetched by term based on lat+long AND returns at least one business AS a BusinessSearch Object AND imageUrl isNotNull', () async {
      BusinessSearch search = await api.fetchBusinessSearch(term: 'delis', latitude: 37.786882, longitude: -122.399972, limit: 1);

      expect(search.businesses?.businesses?.first.imageUrl, isNotNull);
    });

    test('BusinessSearch IS consistent between Object/JSON return types', () async {
      BusinessSearch search = await api.fetchBusinessSearch(location: 'Austin, TX', asObject: true, categories: 'restaurants, All', limit: 1);
      dynamic searchAsJSON = await api.fetchBusinessSearch(location: 'Austin, TX', asObject: false, categories: 'restaurants, All', limit: 1);

      expect(search.businesses?.businesses?.first.imageUrl, equals(searchAsJSON['businesses']?.first['image_url']));
    });
  });

  group('fetchBusinessReviews', () {
    test('Business Reviews ARE Fetched by Business alias/id AND returns at least one business review', () async {
      var reviews = await api.fetchBusinessReviews(id: 'north-india-restaurant-san-francisco');

      expect(reviews.total, greaterThan(0));
    });

    test('Business Reviews ARE Fetched by Business alias/id AND review list contains no more than three business reviews', () async {
      var reviews = await api.fetchBusinessReviews(id: 'north-india-restaurant-san-francisco');

      expect(reviews.reviews.length, lessThanOrEqualTo(3));
    });
  });
}
