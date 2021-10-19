import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_search_medically_home/constants.dart';
import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/main_common.dart';

void main() {
  final qaConfig = FlavorConfig(
      apiEndpoint: url!,
      appTitle: 'Pet Search QA',
      apiKey: dotenv.env['API_KEY']!,
      apiSecret: dotenv.env['API_SECRET']!);

  mainCommon(qaConfig);
}
