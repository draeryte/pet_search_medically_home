import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
//import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pet_search_medically_home/controller/services/search_animals_api.dart';
import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';
import 'package:pet_search_medically_home/controller/services/token_api.dart';
//import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/model/favorite.dart';

import 'package:pet_search_medically_home/views/favorites_screen.dart';
import 'package:pet_search_medically_home/views/pet_details_screen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchByOption = '';
  TextEditingController searchField = TextEditingController();
  bool searchEnabled = false;
  bool showResults = false;
  List animals = [];
  FocusNode textFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Search'),
        centerTitle: false,
        actions: [GoToFav()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Please select a search option'),
              value: searchByOption,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onTap: () async {
                String? token =
                    await SecureStorage.secureStorage.read(key: 'accessToken');
                if (token != null && JwtDecoder.isExpired(token) != true) {
                } else if (JwtDecoder.isExpired(token!) == true ||
                    token == '') {
                  await SecureStorage.secureStorage.deleteAll();
                  getAccessToken();
                }
              },
              onChanged: (String? newValue) {
                setState(() {
                  searchByOption = newValue!;
                  searchEnabled = true;
                });
              },
              items: <String>['', 'type', 'color', 'gender', 'breed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            searchEnabled
                ? CustomTextField(
                    searchField: searchField,
                    lebelText: 'Search Pets',
                  )
                : Container(),
            searchEnabled
                ? OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        showResults = true;
                      });
                    },
                    child: const Text('Search'))
                : Container(),
            showResults
                ? Expanded(
                    child: FutureBuilder(
                    future: getAnimalsBy(searchByOption, searchField.text),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  Animal animalSelected = Animal(
                                      id: snapshot.data[index].id,
                                      animalType:
                                          snapshot.data[index].animalType,
                                      breed: snapshot.data[index].breed,
                                      color: snapshot.data[index].color,
                                      gender: snapshot.data[index].gender,
                                      photoLink: snapshot.data[index].photoLink,
                                      url: snapshot.data[index].url,
                                      name: snapshot.data[index].name,
                                      description:
                                          snapshot.data[index].description);

                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) => PetDetailScreen(
                                              animalSelected:
                                                  animalSelected))));
                                },
                                title: Text(snapshot.data[index].name),
                                subtitle:
                                    Text(snapshot.data[index].description),
                                leading: Image.network(
                                    snapshot.data[index].photoLink,
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    fit: BoxFit.cover),
                              );
                            });
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ))
                : Container()
          ],
        ),
      ),
    );
  }
}

class GoToFav extends StatelessWidget {
  const GoToFav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesModel>(builder: (context, value, child) {
      return TextButton(
          onPressed: () {
            Navigator.push(
                context,
                (MaterialPageRoute(
                    builder: (context) => const FavoriteScreen())));
          },
          child: Text(
            '${value.listLength} Favs',
            style: const TextStyle(color: Colors.white),
          ));
    });
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.searchField,
    required this.lebelText,
  }) : super(key: key);

  final TextEditingController searchField;
  final String lebelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchField,
      decoration: const InputDecoration(
        labelText: 'Search pets',
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
