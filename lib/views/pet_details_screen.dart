import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/controller/services/share.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/model/favorite.dart';

import 'package:pet_search_medically_home/views/home.dart';
import 'package:provider/provider.dart';

class PetDetailScreen extends StatefulWidget {
  final Animal animalSelected;
  const PetDetailScreen({required this.animalSelected, Key? key})
      : super(key: key);

  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  bool saved = false;
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
        child: ListView(
          children: [
            Image.network(
              widget.animalSelected.photoLink!,
              height: MediaQuery.of(context).size.height * .4,
              fit: BoxFit.fitWidth,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .28,
                  child: OutlinedButton(
                      onPressed: () {
                        ShareNative().shareThing(widget.animalSelected.url!);
                      },
                      child: const Text('Share')),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .28,
                  child: OutlinedButton(
                      onPressed: () {
                        ShareNative()
                            .shareViaCode(widget.animalSelected.url!, context);
                      },
                      child: const Text('QR')),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * .28,
                    child: Consumer<FavoritesModel>(
                        builder: (context, value, child) {
                      return OutlinedButton(
                          onPressed: () {
                            context
                                .read<FavoritesModel>()
                                .addAnimal(widget.animalSelected);
                          },
                          child: Text(
                              value.checkIfAnimalSaved(widget.animalSelected)
                                  ? 'Unsave'
                                  : 'Save'));
                    }))
              ],
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.animalSelected.name!),
                  Text(widget.animalSelected.breed!),
                  Text(widget.animalSelected.gender!),
                ],
              ),
            ),
            Text(widget.animalSelected.description!),
          ],
        ),
      ),
    );
  }
}
