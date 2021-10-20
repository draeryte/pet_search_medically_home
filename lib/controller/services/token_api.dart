import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pet_search_medically_home/constants.dart';
import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';

Future getAccessToken(
    String apiKey, String clientSecret, http.Client client) async {
  Map<String, String> header = {
    "Content-Type": "application/x-www-form-urlencoded"
  };

  Map<String, String> body = {
    "grant_type": "client_credentials",
    "client_id": apiKey,
    "client_secret": clientSecret
  };

  try {
    var res = await client.post(Uri.parse(url! + "/oauth2/token"),
        body: body, headers: header);

    if (res.statusCode == 200) {
      var jsonData = json.decode(res.body);
      SecureStorage.secureStorage
          .write(key: "accessToken", value: jsonData['access_token']);

      return res.statusCode;
    } else {
      return res.statusCode;
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}
