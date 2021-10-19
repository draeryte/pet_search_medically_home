import 'package:flutter/material.dart';

import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:provider/provider.dart';
import 'views/home.dart';

void mainCommon(FlavorConfig configuration) async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FavoritesModel()),
    ChangeNotifierProvider(
        create: (context) => FlavorConfig(
            appTitle: configuration.appTitle,
            apiEndpoint: configuration.apiEndpoint,
            apiKey: configuration.apiKey,
            apiSecret: configuration.apiSecret)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Search',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}
