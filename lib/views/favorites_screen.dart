import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:pet_search_medically_home/views/components/animal_list_tile.dart';

import 'package:pet_search_medically_home/views/pet_details_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<Animal> favAnimals = context.watch<FavoritesModel>().getFavList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Search'),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {
                context.read<FavoritesModel>().removeAllAnimals();
                setState(() {});
              },
              child: const Text(
                'Delete All',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: favAnimals.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Animal animalSelected = Animal(
                    id: favAnimals[index].id,
                    animalType: favAnimals[index].animalType,
                    breed: favAnimals[index].breed,
                    color: favAnimals[index].color,
                    gender: favAnimals[index].gender,
                    photoLink: favAnimals[index].photoLink,
                    url: favAnimals[index].url,
                    name: favAnimals[index].name,
                    description: favAnimals[index].description);

                Navigator.push(
                    context,
                    (MaterialPageRoute(
                        builder: (context) =>
                            PetDetailScreen(animalSelected: animalSelected))));
              },
              child: AnimalListTile(favAnimals: favAnimals, index: index),
            );
          }),
    );
  }
}
