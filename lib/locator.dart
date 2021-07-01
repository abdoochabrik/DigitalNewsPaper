import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/services/news_service.dart';

final locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton<NewsService>(() => NewsService());
}
