# How to use the Yelp Fusion Client

1. Create an Instance of the Client API and Specify Your API Key as the Parameter

```dart
final YelpFusion api = YelpFusion(apiKey: '<Your Yelp Fusion API Key>');
```

1. Use the YelpFusion Object to Access Various Methods

```dart
api.fetchBusinessDetails(id: 'north-india-restaurant-san-francisco', asObject: true)
  .then((details) => print(details.alias));
```

**Note:** The `asObject` parameter in each method describes whether the method should return data in pure **json** format or as a dart **Object** which can be used to *access* individual components of the API response.

**See:** [yelp_fusion_client/test](https://github.com/HelloFro/yelp_fusion_client/tree/test/test) for example dart testing cases.
