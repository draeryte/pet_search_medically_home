import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/model/animal.dart';

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
      title: Text(favAnimals[index].name!),
      subtitle: Text(favAnimals[index].description!),
      leading: Image.network(favAnimals[index].photoLink!,
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.width * .2,
          fit: BoxFit.cover),
    );
  }
}
