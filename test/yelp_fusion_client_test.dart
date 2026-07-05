import 'package:test/test.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_search.dart';

void main() {
  group('BusinessSearched.fromMap', () {
    final sampleMap = <String, dynamic>{
      'id': 'E8RJkjfdcwgtyoPMjQ_Olg',
      'alias': 'four-barrel-coffee-san-francisco',
      'name': 'Four Barrel Coffee',
      'image_url': 'https://s3-media2.fl.yelpcdn.com/bphoto/photo.jpg',
      'url': 'https://www.yelp.com/biz/four-barrel-coffee-san-francisco',
      'phone': '+14152521625',
      'display_phone': '(415) 252-1625',
      'review_count': 1738,
      'rating': 4.0,
      'price': r'$',
      'distance': 1604.23,
      'categories': [
        {'alias': 'coffee', 'title': 'Coffee & Tea'}
      ],
      'coordinates': {'latitude': 37.7670169511878, 'longitude': -122.42184275},
      'location': {
        'address1': '375 Valencia St',
        'city': 'San Francisco',
        'zip_code': '94103',
        'country': 'US',
        'state': 'CA',
        'display_address': ['375 Valencia St', 'San Francisco, CA 94103']
      },
      'transactions': ['pickup', 'delivery'],
    };

    test('parses display_phone and review_count (issue #13)', () {
      final business = BusinessSearched.fromMap(sampleMap);

      expect(business.displayPhone, '(415) 252-1625');
      expect(business.reviewCount, 1738);
    });

    test('parses the remaining top-level fields', () {
      final business = BusinessSearched.fromMap(sampleMap);

      expect(business.id, 'E8RJkjfdcwgtyoPMjQ_Olg');
      expect(business.alias, 'four-barrel-coffee-san-francisco');
      expect(business.name, 'Four Barrel Coffee');
      expect(business.phone, '+14152521625');
      expect(business.rating, 4.0);
      expect(business.transactions, ['pickup', 'delivery']);
    });

    test('does not throw when transactions is absent', () {
      final map = Map<String, dynamic>.from(sampleMap)..remove('transactions');

      final business = BusinessSearched.fromMap(map);

      expect(business.transactions, isNull);
      expect(business.displayPhone, '(415) 252-1625');
    });

    test('returns an empty object for a null map', () {
      final business = BusinessSearched.fromMap(null);

      expect(business.id, isNull);
      expect(business.displayPhone, isNull);
      expect(business.reviewCount, isNull);
    });
  });
}
