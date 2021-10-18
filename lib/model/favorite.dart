import 'package:flutter/foundation.dart';
import 'package:pet_search_medically_home/model/animal.dart';

class FavoritesModel extends ChangeNotifier {
  final List<Animal> _favList = [];

  int get listLength => _favList.length;
  List<Animal> get getFavList => _favList;

  void addAnimal(Animal animal) {
    checkIfAnimalSaved(animal) ? removeAnimal(animal) : _favList.add(animal);
    notifyListeners();
  }

  void removeAnimal(Animal animal) {
    _favList.remove(animal);
    notifyListeners();
  }

  void removeAllAnimals() {
    _favList.clear();
    notifyListeners();
  }

  bool checkIfAnimalSaved(Animal animal) {
    if (_favList.any((element) => element.id == animal.id) == true) {
      return true;
    } else {
      return false;
    }
  }
}
