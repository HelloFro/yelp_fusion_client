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

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source));

  @override
  String toString() =>
      'Coordinates(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coordinates &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude);
}
