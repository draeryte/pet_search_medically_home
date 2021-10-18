import 'package:flutter_test/flutter_test.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/model/favorite.dart';

void main() {
  test('Given when a new favorite animal is added and removed', () async {
    FavoritesModel favAnimal = FavoritesModel();
    final animal = Animal(
        id: 1,
        animalType: "Dog",
        breed: "Husky",
        color: "Grey",
        gender: "Male",
        photoLink: "www.google.com",
        url: "www.apple.com",
        name: "The Husk",
        description: "You see he's got all the husk");
    //Adding animal to favorite list
    favAnimal.addAnimal(animal);

    expect(favAnimal.getFavList.first, animal);
    expect(favAnimal.listLength, 1);

    //Remove animal from favorite list
    favAnimal.removeAnimal(animal);

    expect(favAnimal.listLength, 0);
    expect(favAnimal.getFavList.contains(animal), false);
  });
}
