import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/main_common.dart';

void main() async {
  await dotenv.dotenv.load(fileName: ".env");
  final staggingConfig = FlavorConfig(
      apiEndpoint: "someendpoint",
      appTitle: 'Pet Search Stagging',
      apiKey: dotenv.dotenv.env['API_KEY']!,
      apiSecret: dotenv.dotenv.env['CLIENT_SECRET']!);

  mainCommon(staggingConfig);
}
