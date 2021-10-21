import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:pet_search_medically_home/views/favorites_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('favorites screen ...', (tester) async {
    await dotenv.load(fileName: ".env");
    final qaConfig = FlavorConfig(
        apiEndpoint: 'some string',
        appTitle: 'Pet Search QA',
        apiKey: dotenv.env['API_KEY']!,
        apiSecret: dotenv.env['CLIENT_SECRET']!);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoritesModel()),
          ChangeNotifierProvider(
              create: (context) => FlavorConfig(
                  appTitle: qaConfig.appTitle,
                  apiEndpoint: qaConfig.apiEndpoint,
                  apiKey: qaConfig.apiKey,
                  apiSecret: qaConfig.apiSecret)),
        ],
        child: const MaterialApp(
          home: FavoriteScreen(),
        )));

    final deleteAllButton = find.byType(TextButton);
    final animalListView = find.byType(ListView);
  });
}
