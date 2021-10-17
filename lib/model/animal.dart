// class Animal {
//   final int? id;
//   final String? animalType;
//   final Breeds? breed;
//   final Colors? color;
//   final Photos? photoLink;
//   final String? gender;
//   final String? url;
//   final String? name;
//   final String? description;

//   Animal(
//       {this.id,
//       this.animalType,
//       this.breed,
//       this.color,
//       this.gender,
//       this.photoLink,
//       this.url,
//       this.name,
//       this.description});

//   // Animal.fromJson(Map<String, dynamic> json) {
//   //   id = json['id']?.toInt();
//   //   animalType = json['type']?.toString();
//   //   color = (json['colors'] !null) ? AnimalColors.fromJson(json['colors']) : null;

//   // }
// }

// class Breeds {
//   String? primary;
//   String? secondary;
//   bool? mixed;
//   bool? unknown;

//   Breeds({this.primary, this.secondary, this.mixed, this.unknown});
// }

// class Colors {
//   String? primary;
//   String? secondary;
//   String? tertiary;

//   Colors({this.primary, this.secondary, this.tertiary});
// }

// class Photos {
//   String? small;
//   String? medium;
//   String? large;

//   Photos({this.small, this.medium, this.large});
// }

class Animal {
  List<Animals>? animals;

  Animal({this.animals});

  Animal.fromJson(Map<String, dynamic> json) {
    if (json['animals'] != null) {
      animals = <Animals>[];
      json['animals'].forEach((v) {
        animals?.add(Animals.fromJson(v));
      });
    }
  }
}

class Animals {
  int? id;
  String? organizationId;
  String? url;
  String? type;
  String? species;
  Breeds? breeds;
  AnimalColors? colors;
  String? age;
  String? gender;
  String? size;
  String? coat;

  String? name;
  String? description;
  String? organizationAnimalId;
  List<Photos>? photos;
  Photos? primaryPhotoCropped;

  String? status;

  Animals({
    this.id,
    this.organizationId,
    this.url,
    this.type,
    this.species,
    this.breeds,
    this.colors,
    this.age,
    this.gender,
    this.size,
    this.coat,
    this.name,
    this.description,
    this.organizationAnimalId,
    this.photos,
    this.primaryPhotoCropped,
    this.status,
  });

  Animals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organization_id'];
    url = json['url'];
    type = json['type'];
    species = json['species'];
    breeds = json['breeds'] != null ? Breeds.fromJson(json['breeds']) : null;
    colors =
        json['colors'] != null ? AnimalColors.fromJson(json['colors']) : null;
    age = json['age'];
    gender = json['gender'];
    size = json['size'];
    coat = json['coat'];

    name = json['name'];
    description = json['description'];
    organizationAnimalId = json['organization_animal_id'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    primaryPhotoCropped = json['primary_photo_cropped'] != null
        ? Photos.fromJson(json['primary_photo_cropped'])
        : null;

    status = json['status'];
  }
}

class Breeds {
  String? primary;
  String? secondary;
  bool? mixed;
  bool? unknown;

  Breeds({this.primary, this.secondary, this.mixed, this.unknown});

  Breeds.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
    mixed = json['mixed'];
    unknown = json['unknown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    data['mixed'] = mixed;
    data['unknown'] = unknown;
    return data;
  }
}

class AnimalColors {
  String? primary;
  String? secondary;
  String? tertiary;

  AnimalColors({this.primary, this.secondary, this.tertiary});

  AnimalColors.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
    tertiary = json['tertiary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    data['tertiary'] = tertiary;
    return data;
  }
}

class Photos {
  String? small;
  String? medium;
  String? large;
  String? full;

  Photos({this.small, this.medium, this.large, this.full});

  Photos.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    data['full'] = full;
    return data;
  }
}
