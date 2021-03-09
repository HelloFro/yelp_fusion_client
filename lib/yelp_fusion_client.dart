library yelp_fusion_client;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:yelp_fusion_client/models/business_endpoints/business_details.dart';

/// A Dart class to get all the endpoints of the Yelp Fusion API.
class YelpFusion {
  /// Yelp Fusion API Key
  String apiKey;

  /// Headers for Authorization and Content Request Type
  Map<String, String> _headers;

  /// Requires API Key, sets GET request headers
  YelpFusion({@required this.apiKey}) : assert(apiKey != null) {
    _headers = {
      'Authorization': 'Bearer $apiKey',
      "Content-type": "application/json",
    };
  }

  /** Get rich business data, such as name, address, phone number, photos, Yelp rating, price levels and hours of operation.
    
    * id: Required. Business id or alias.

    * locale: Optional. Default=en_US.
  */
  Future fetchBusinessDetails(
    {@required String id,
    String locale,
    bool asObject = true}
  ) async {
    assert(id != null);

    var params = {
      if(locale != null)
        'locale': locale,
    };

    var url = Uri.https('api.yelp.com', 'v3/businesses/$id', params);

    final response = await http.get(url, headers: _headers);

    Map<String, dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('error'))
      return jsonData['error'];
    else
      return asObject ? BusinessDetails.fromJson(response.body) : jsonData;
  }

  
}