import 'package:movie_app/app/constants/app_apis.dart';

class BaseRequestParam {
  const BaseRequestParam({
    this.apiKey = AppApi.apiKey,
    this.language = 'en-US',
  });

  final String apiKey;
  final String language;
}
