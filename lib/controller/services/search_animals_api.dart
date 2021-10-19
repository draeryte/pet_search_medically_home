import 'dart:convert';
import 'dart:developer';
//import 'dart:io';

import 'package:http/http.dart' as http;
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_search_medically_home/constants.dart';
import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';
import 'package:pet_search_medically_home/model/animal.dart';

Future getAnimalsBy(String searchOption, String searchTerm) async {
  String? token = await SecureStorage.secureStorage.read(key: "accessToken");
  Map<String, String> header = {"Authorization": "Bearer $token"};
  try {
    var res = await http.get(
        Uri.parse(url! + "/animals?$searchOption=$searchTerm"),
        headers: header);
    if (res.statusCode == 200) {
      var response = json.decode(res.body);
      var creatures = response['animals'];
      List<Animal> animals = animalFromJson(creatures);
      return animals.toList();
    } else {
      return <Animal>[];
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}
