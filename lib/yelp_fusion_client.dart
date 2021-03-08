library yelp_fusion_client;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';



/* A Dart class to get all the endpoints of the Yelp Fusion API. */
class YelpFusion {
  /* Your Yelp Fusion API Key */
  String apiKey;

  YelpFusion({@required this.apiKey}) : assert(apiKey != null);

  
}