import 'package:flutter_test/flutter_test.dart';
import 'package:pet_search_medically_home/model/animal.dart';

import 'animal_map_string.dart';

void main() {
  test('Given when an animal is created from a Map<String, dynamic>', () async {
    List<Animal> animalsCreated = animalFromJson(animalMapString['animals']);

    expect(animalsCreated.length, 2);
    expect(animalsCreated[0].name, "Shampoo");
    expect(animalsCreated[1].name, "Dusty");
  });
}
