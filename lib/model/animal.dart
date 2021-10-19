import 'dart:convert';

List<Animal> animalFromJson(dynamic json) {
  List<Animal> jsonObj =
      List<Animal>.from(json.map((x) => Animal.fromJson(x))).toList();
  return jsonObj;
}

class Animal {
  int? id;
  String? animalType;
  String? breed;
  String? color;
  String? photoLink;
  String? gender;
  String? url;
  String? name;
  String? description;

  Animal(
      {this.id,
      this.animalType,
      this.breed,
      this.color,
      this.gender,
      this.photoLink,
      this.url,
      this.name,
      this.description});

  Animal.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 00000;
    animalType = json['type'] ?? '';
    breed = json['breeds']['primary'] ?? 'Don\'t know';
    color = json['colors']['primary'] ?? 'Don\'t know';
    gender = json['gender'] ?? '';
    photoLink = json['primary_photo_cropped'] != null &&
            json['primary_photo_cropped']['large'] != null
        ? json['primary_photo_cropped']['large']
        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsEyagmclsaPJQVvA_BheOwSyqQbl1MU-urg&usqp=CAU";
    url = json['url'] ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsEyagmclsaPJQVvA_BheOwSyqQbl1MU-urg&usqp=CAU';
    name = json['name'] ?? '';
    description = json['description'] ?? '';
  }
}
