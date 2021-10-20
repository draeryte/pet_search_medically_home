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
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const ErrorMessageToUser(
                errorMessage: "Error! \n Try checking internet connection");
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          default:
            if (snapshot.data == 1) {
              return const ErrorMessageToUser(
                errorMessage: 'Connection timed out. Try again later',
              );
            } else if (snapshot.data == 2) {
              return const ErrorMessageToUser(
                errorMessage: 'Could not reach server. Try again later',
              );
            } else if (snapshot.data.length != 0) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<Animal> animals = snapshot.data;
                    return AnimalListTile(favAnimals: animals, index: index);
                  });
            } else {
              return const ErrorMessageToUser(
                errorMessage: 'No Results Found \n \nTry Another Search Term',
              );
            }
        }
      },
    ));
  }
}

class ErrorMessageToUser extends StatelessWidget {
  final String errorMessage;
  const ErrorMessageToUser({
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage,
          textAlign: TextAlign.center, style: infoMessageBold),
    );
  }
}
