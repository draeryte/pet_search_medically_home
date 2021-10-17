import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/controller/services/share.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/views/components/appbar_of_app.dart';

class PetDetailScreen extends StatelessWidget {
  final Animal animalSelected;

  PetDetailScreen({required this.animalSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(animalSelected.photoLink!),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {
                      ShareNative().shareThing(animalSelected.url!);
                    },
                    child: const Text('Share')),
                OutlinedButton(
                    onPressed: () {
                      ShareNative().shareViaCode(animalSelected.url!, context);
                    },
                    child: const Text('Share')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(animalSelected.name!),
                Text(animalSelected.breed!)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
