import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';
import 'package:pet_search_medically_home/controller/services/token_api.dart';

//@GenerateMocks([http.Client])
class MockHttp extends Mock implements http.BaseClient {}

void main() {
  test('Given when a user tries to get a token', () async {
    await dotenv.load(fileName: ".env");

    Uri url = Uri.parse(dotenv.env['API_URL']!);
    final MockHttp client = MockHttp();

    when(MockHttp().post(url)).thenAnswer((invocation) => Future.value(
        http.Response('{"access_token": "siubekfbeodncbece"}', 200)));

    getAccessToken(
        dotenv.env['API_KEY']!, dotenv.env['CLIENT_SECRET']!, client);
    expectLater(SecureStorage.secureStorage.read(key: "accessToken"),
        "siubekfbeodncbece");
  });
}
