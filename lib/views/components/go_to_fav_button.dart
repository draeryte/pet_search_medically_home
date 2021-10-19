import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:pet_search_medically_home/views/favorites_screen.dart';

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
