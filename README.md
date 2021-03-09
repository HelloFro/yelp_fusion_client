# yelp_fusion_client

A Dart Client for Yelp Fusion API.

![](Yelp-Fusion-Dart-Banner.png)

This Dart package reduces the work to write Future methods and https requests to fetch the API and parse the json data for developers looking to use the Yelp Fusion API in an app. Developers can retrieve API data formatted as json or package defined Dart Objects.

## Getting Started

1. Register with a Yelp User Account. If you don't already have one, please visit [Yelp Fusion Sign Up](https://www.yelp.com/signup) to sign up.

1. Once you have a Yelp user account and have signed in, you can go to the Manage App page to create an app with Yelp. Then, you'll get your API Key, which you can use for calls in the Yelp Fusion Client.

See: [Developer Documentation](https://www.yelp.com/developers/documentation/v3)

## How to use the Yelp Fusion Client

1. Create an Instance of the Client API and Specify Your API Key as the Parameter

```dart
final YelpFusion api = YelpFusion(apiKey: '<Your Yelp Fusion API Key>');
```

1. Use the YelpFusion Object to Access Various Methods

```dart
api.fetchBusinessDetails(id: 'north-india-restaurant-san-francisco', asObject: true)
  .then((details) => print(details.alias));
```

*Note : The `asObject` parameter in each method describes whether the method should return data in pure json format or as a dart object which can be used to access individual components of the api response.*

## Methods Provided by YelpFusion Client API

- `fetchAutocomplete()` : Get autocomplete suggestions for search keywords, businesses and categories, based on the input text.
- `fetchBusinessDetails()` : Get rich business data, such as name, address, phone number, photos, Yelp rating, price levels and hours of operation.
- `fetchBusinessReviews()` : Get up to three review excerpts, the URL to the full review, the Yelp rating with each review excerpt as well as the name and profile photo of the reviewer.
- `fetchBusinessSearch()` : Get up to 1000 businesses based on the provided search criteria.

## Methods Return Types

Method name | `asObject = true`| `asObject = false` or Error |
:-----------:|:-------------------:|:---------
fetchAutocomplete() | Autocomplete | Map<String, dynamic>
fetchBusinessDetails() | BusinessDetails | Map<String, dynamic>
fetchBusinessReviews() | BusinessReviews | Map<String, dynamic>
fetchBusinessSearch() | BusinessSearch | Map<String, dynamic>

*Note : You can use the `.` operator to know which members are available for each returned object when `asObject=true`.*

## Notes/Issues

If you like this package, please leave a :+1:.

If something is missing or broken, please raise an issue on [GitHub](https://github.com/HelloFro/yelp_fusion_client/issues) and I will address it as soon as I can.
