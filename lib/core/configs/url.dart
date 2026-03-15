class Urls {
  static const String baseUrl = 'http://itikaftracker.somee.com/api/';
  static const String login = baseUrl + 'auth/login';
  static const String getAllItikaf = baseUrl + 'itikaf';
  static const String getItikafById = baseUrl + 'itikaf/';
  static const String addItikaf = baseUrl + 'itikaf';
  static const String updateItikaf = baseUrl + 'itikaf/';
  static const String deleteItikaf = baseUrl + 'itikaf/';

  static const String baseUrlGoogleSheet =
      'https://script.google.com/macros/s/AKfycbzg6hbUKx47OJ-b0rewUgyKP3JnFTRMm93stbzyuiAXmyzYfJEs2lwfdxpAALr7mbRg/exec';

  static const String getAllItikafGoogleSheet =
      baseUrlGoogleSheet + '?action=itikaf';
  static const String getAllAbsenGoogleSheet =
      baseUrlGoogleSheet + '?action=absen';
  static const String getAbsenByIdGoogleSheet =
      baseUrlGoogleSheet + '?action=absen&id=';
  static const String getItikafByIdGoogleSheet =
      baseUrlGoogleSheet + '?action=itikaf&id=';
}
