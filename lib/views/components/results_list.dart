import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/constants.dart';
import 'package:pet_search_medically_home/controller/services/search_animals_api.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/views/pet_details_screen.dart';

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
                  return ListTile(
                    onTap: () {
                      Animal animalSelected = Animal(
                          id: snapshot.data[index].id,
                          animalType: snapshot.data[index].animalType,
                          breed: snapshot.data[index].breed,
                          color: snapshot.data[index].color,
                          gender: snapshot.data[index].gender,
                          photoLink: snapshot.data[index].photoLink,
                          url: snapshot.data[index].url,
                          name: snapshot.data[index].name,
                          description: snapshot.data[index].description);

                      Navigator.push(
                          context,
                          (MaterialPageRoute(
                              builder: (context) => PetDetailScreen(
                                  animalSelected: animalSelected))));
                    },
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].description),
                    leading: Image.network(snapshot.data[index].photoLink,
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width * .2,
                        fit: BoxFit.cover),
                  );
                });
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
