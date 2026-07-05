# yelp_fusion_client

A Dart Client for the Yelp Places API (formerly Yelp Fusion API).

![](https://github.com/HelloFro/yelp_fusion_client/blob/main/Yelp-Fusion-Dart-Banner.png)

This Dart package reduces the work to write Future methods and https requests to fetch the API and parse the json data for developers looking to use the Yelp Places API in an app. Developers can retrieve API data formatted as json or package defined Dart Objects.

## Getting Started

1. Register with a Yelp User Account. If you don't already have one, please visit [Yelp Fusion Sign Up](https://www.yelp.com/signup) to sign up.

1. Once you have a Yelp user account and have signed in, you can go to the Manage App page to create an app with Yelp. Then, you'll get your API Key, which you can use for calls in the Yelp Fusion Client.

*Note : Yelp now offers API access through paid plans. New keys start with a 30-day trial that includes 5,000 free API calls; after that a paid plan is required. Some data, such as the Reviews endpoint, is only available on higher-tier plans. See [Yelp API plans](https://docs.developer.yelp.com/docs/plans) for details.*

See: [Developer Documentation](https://docs.developer.yelp.com/)

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

## Flutter Web / CORS

The Yelp Fusion API does not send CORS headers, so browsers block requests made directly from web apps. On Flutter Web this surfaces as:

```
Error: XMLHttpRequest error.
```

This is a restriction of the Yelp API itself and cannot be fixed from Dart code. To use this package on the web, route requests through your own CORS proxy (e.g. a small Cloud Function or server that forwards requests to `api.yelp.com` and adds the `Access-Control-Allow-Origin` header), then point the client at it:

```dart
final YelpFusion api = YelpFusion(
  apiKey: '<Your Yelp Fusion API Key>',
  baseUrl: 'your-proxy.example.com', // defaults to api.yelp.com
);
```

On mobile and desktop no proxy is needed — the default `baseUrl` works as-is.

## Notes/Issues

If you like this package, please leave a :+1:.

If something is missing or broken, please raise an issue on [GitHub](https://github.com/HelloFro/yelp_fusion_client/issues) and I will address it as soon as I can.
