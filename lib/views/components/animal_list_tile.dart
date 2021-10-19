import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/views/pet_details_screen.dart';

class AnimalListTile extends StatelessWidget {
  const AnimalListTile({
    Key? key,
    required this.favAnimals,
    required this.index,
  }) : super(key: key);

  final List<Animal> favAnimals;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      title: Text(favAnimals[index].name!),
      subtitle: Text(favAnimals[index].description!),
      leading: Image.network(favAnimals[index].photoLink!,
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.width * .2,
          fit: BoxFit.cover),
    );
  }
}
