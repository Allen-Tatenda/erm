import 'base_urls.dart';
import 'staging_urls.dart';

class EnvironmentUrls {
  static BaseUrls urls() {
    // return ProductionUrls();
    return StagingUrls();
  }
}
