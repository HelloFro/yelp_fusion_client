import 'dart:convert';

/// The coordinates of a business.
class Coordinates {
  /// The latitude of a business.
  final double? latitude;

  /// The longitude of a business.
  final double? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Coordinates();
  
    return Coordinates(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  factory Coordinates.fromJson(String source) => Coordinates.fromMap(json.decode(source));

  @override
  String toString() => 'Coordinates(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Coordinates &&
      o.latitude == latitude &&
      o.longitude == longitude;
  }
}
