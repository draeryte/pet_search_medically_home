import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/main_common.dart';
import '../constants.dart';

void main() {
  final devConfig = FlavorConfig(
      apiEndpoint: url!,
      appTitle: "Pet Search Dev",
      apiKey: dotenv.env['API_KEY']!,
      apiSecret: dotenv.env['CLIENT_SECRET']!);

  mainCommon(devConfig);
}
