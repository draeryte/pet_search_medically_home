import 'package:flutter/foundation.dart';
import 'package:pet_search_medically_home/model/animal.dart';

class FavoritesModel extends ChangeNotifier {
  final List<Animal> _favList = [];

  int get listLength => _favList.length;

  void addAnimal(Animal animal) {
    if (_favList.contains(animal) == true) {
    } else {
      _favList.add(animal);
    }
    notifyListeners();
  }

  void removeAnimal(Animal animal) {
    _favList.remove(animal);
    notifyListeners();
  }

  void removeAllAnimals() {
    _favList.clear();
  }

  List<Animal> exposeList() {
    return _favList;
  }
}
