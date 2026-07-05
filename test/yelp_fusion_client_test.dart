import 'package:test/test.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_details.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_reviews.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_search.dart';
import 'package:yelp_fusion_client/models/hours.dart';
import 'package:yelp_fusion_client/models/location.dart';

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
      'business_hours': [
        {
          'hours_type': 'REGULAR',
          'is_open_now': true,
          'open': [
            {'day': 0, 'start': '0700', 'end': '2000', 'is_overnight': false}
          ]
        }
      ],
      'attributes': {
        'business_temp_closed': null,
        'menu_url': 'https://fourbarrelcoffee.com/menu',
        'open24_hours': false,
      },
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

    test('parses business_hours and attributes', () {
      final business = BusinessSearched.fromMap(sampleMap);

      expect(business.businessHours?.hours, hasLength(1));
      expect(business.businessHours?.hours?.first.hoursType, 'REGULAR');
      expect(business.businessHours?.hours?.first.isOpenNow, isTrue);
      expect(business.businessHours?.hours?.first.open?.first.day, 0);
      expect(business.attributes?['menu_url'],
          'https://fourbarrelcoffee.com/menu');
    });

    test('coerces integer rating and distance to double', () {
      final map = Map<String, dynamic>.from(sampleMap)
        ..['rating'] = 4
        ..['distance'] = 1604;

      final business = BusinessSearched.fromMap(map);

      expect(business.rating, 4.0);
      expect(business.distance, 1604.0);
    });
  });

  group('parsing tolerates absent list keys', () {
    test('BusinessDetails.fromMap without photos/transactions', () {
      final details = BusinessDetails.fromMap({
        'id': 'abc',
        'name': 'Some Business',
        'rating': 4,
      });

      expect(details.photos, isNull);
      expect(details.transactions, isNull);
      expect(details.rating, 4.0);
    });

    test('BusinessReviews.fromMap without reviews/possible_languages', () {
      final reviews = BusinessReviews.fromMap({'total': 0});

      expect(reviews.total, 0);
      expect(reviews.reviews, isNull);
      expect(reviews.possibleLanguages, isNull);
    });

    test('Location.fromMap without display_address', () {
      final location = Location.fromMap({'city': 'San Francisco'});

      expect(location.city, 'San Francisco');
      expect(location.displayAddress, isNull);
    });

    test('Hours.fromMap without open', () {
      final hours = Hours.fromMap({'hours_type': 'REGULAR'});

      expect(hours.hoursType, 'REGULAR');
      expect(hours.open, isNull);
    });
  });
}
