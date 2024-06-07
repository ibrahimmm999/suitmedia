class UrlService {
  String baseUrl = 'https://reqres.in/api/users?page=1&per_page=100';
  Uri api() {
    return Uri.parse(baseUrl);
  }
}
