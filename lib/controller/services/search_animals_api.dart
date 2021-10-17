import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_search_medically_home/constants.dart';
import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';

Future getAnimalsBy(String searchOption, String searchTerm) async {
  Map<String, String> header = {
    "Authorization": "Bearer ${SecureStorage.readSecureStorage('accessToken')}"
  };
  try {
    var res = await http.get(
        Uri.parse(url! + "/animals?$searchOption=$searchTerm"),
        headers: header);
    if (res.statusCode == 200) {
      var response = json.decode(res.body);
      return response;
    }
    log(res.body);
  } catch (e) {
    return null;
  }
}
