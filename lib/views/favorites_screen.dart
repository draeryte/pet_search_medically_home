import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/model/animal.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:pet_search_medically_home/views/components/appbar_of_app.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<Animal> favAnimals = context.watch<FavoritesModel>().exposeList();

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
            return ListTile(
              title: Text(favAnimals[index].name!),
              subtitle: Text(favAnimals[index].description!),
              leading: Image.network(favAnimals[index].photoLink!,
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .2,
                  fit: BoxFit.cover),
            );
          }),
    );
  }
}
// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Animal> favAnimals = context.watch<FavoritesModel>().exposeList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pet Search'),
//         centerTitle: false,
//         actions: [
//           TextButton(
//               onPressed: () {
//                 context.read<FavoritesModel>().removeAllAnimals();
//               },
//               child: const Text(
//                 'Delete All',
//                 style: TextStyle(color: Colors.white),
//               ))
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: favAnimals.length,
//           itemBuilder: (context, int index) {
//             return ListTile(
//               title: Text(favAnimals[index].name!),
//               subtitle: Text(favAnimals[index].description!),
//               leading: Image.network(favAnimals[index].photoLink!,
//                   height: MediaQuery.of(context).size.height * .1,
//                   width: MediaQuery.of(context).size.width * .2,
//                   fit: BoxFit.cover),
//             );
//           }),
//     );
//   }
// }
