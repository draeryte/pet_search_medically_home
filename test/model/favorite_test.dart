import 'package:flutter_test/flutter_test.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/model/favorite.dart';

void main() {
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

  test('Given when a new favorite animal is added and removed', () {
    favAnimal.addAnimal(animal);

    expect(favAnimal.getFavList.contains(animal), true);
  });

  test("Given when an animal is removed from the favorite list", () {
    favAnimal.removeAnimal(animal);

    expect(favAnimal.getFavList.contains(animal), false);
  });

  test("Given when a user checks if an animal is in the favorite list", () {
    favAnimal.addAnimal(animal);

    expect(favAnimal.checkIfAnimalSaved(animal), true);
  });

  test("Given all animals removed from list", () {
    favAnimal.addAnimal(animal);

    favAnimal.removeAllAnimals();

    expect(favAnimal.listLength, 0);
  });
}
