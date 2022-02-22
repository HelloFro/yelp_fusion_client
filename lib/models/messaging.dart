import 'dart:convert';

/// Contains Business Messaging / Request a Quote information for a business.
class Messaging {
  /// Action Link URL that drops user directly in to the messaging flow for a business.
  final String? url;

  /// Indicates what kind of messaging can be done with a business, ie. 
  ///   * "Request a Quote" for a home services business 
  ///   * "Request a Consultation" for a legal services business
  ///  
  ///   Note: Text will be localized based on the "locale" input parameter.
  final String? useCaseText;

  Messaging({
    this.url,
    this.useCaseText,
  });

  factory Messaging.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Messaging();
  
    return Messaging(
      url: map['url'],
      useCaseText: map['use_case_text'],
    );
  }

  factory Messaging.fromJson(String source) => Messaging.fromMap(json.decode(source));

  @override
  String toString() => 'Messaging(url: $url, useCaseText: $useCaseText)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Messaging &&
      o.url == url &&
      o.useCaseText == useCaseText;
  }
}
