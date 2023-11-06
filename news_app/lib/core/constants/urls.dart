class Url {
  //base
  static const String base = 'https://newsapi.org/v2';

  //endpoints
  static const String topHeadlines = '$base/top-headlines';
  static const String topHeadlinesSources = '$base/$topHeadlines/sources';
  static const String everything = '$base/everything';

  //query
  static const String country = 'country';
  static const String page = 'page';
  static const String pageSize = 'pageSize';
  static const String sources = 'sources';
  static const String q = 'q';
  static const String from = 'from';
  static const String to = 'to';
  static const String sortBy = 'sortBy';

  //key
  static const String apiKey = '009ae4dfcef04e1a85af9e747e01db52';
}
