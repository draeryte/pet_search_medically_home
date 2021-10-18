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
      List<Animal> animals = [];

      for (var u in creatures) {
        Animal animal = Animal(
            id: u['id'] ?? 00000,
            animalType: u['type'] ?? '',
            breed: u['breeds']['primary'] ?? 'Don\'t know',
            color: u['colors']['primary'] ?? 'Don\'t know',
            gender: u['gender'] ?? '',
            photoLink: u['primary_photo_cropped'] != null &&
                    u['primary_photo_cropped']['large'] != null
                ? u['primary_photo_cropped']['large']
                : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsEyagmclsaPJQVvA_BheOwSyqQbl1MU-urg&usqp=CAU",
            url: u['url'] ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsEyagmclsaPJQVvA_BheOwSyqQbl1MU-urg&usqp=CAU',
            name: u['name'] ?? '',
            description: u['description'] ?? '');
        animals.add(animal);
      }

      return animals;
      // //  log(creatures.toString());

      // final List<Animals> animals = animalsFromJson(response['animals']);
      // print(animals[1].colors?.primary.toString());

    } else {
      return <Animal>[];
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}
