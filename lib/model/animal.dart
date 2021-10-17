class Animal {
  final int? id;
  final String? animalType;
  final String? breed;
  final String? color;
  final String? photoLink;
  final String? gender;
  final String? url;
  final String? name;
  final String? description;

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

  // Animal.fromJson(Map<String, dynamic> json) {
  //   id = json['id']?.toInt();
  //   animalType = json['type']?.toString();
  //   color = (json['colors'] !null) ? AnimalColors.fromJson(json['colors']) : null;

  // }
}
