import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/constants.dart';
import 'package:pet_search_medically_home/controller/services/search_animals_api.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/views/components/animal_list_tile.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({
    Key? key,
    required this.searchByOption,
    required this.searchField,
  }) : super(key: key);

  final String searchByOption;
  final TextEditingController searchField;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: getAnimalsBy(searchByOption, searchField.text),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No Results Found \n \nTry Another Search Term',
                  textAlign: TextAlign.center, style: infoMessageBold),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  List<Animal> animals = snapshot.data;
                  return AnimalListTile(favAnimals: animals, index: index);
                });
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
