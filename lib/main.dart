import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotEnv;
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:provider/provider.dart';
import 'views/home.dart';

void main() async {
  await dotEnv.dotenv.load(fileName: ".env");
  runApp(ChangeNotifierProvider(
      create: (context) => FavoritesModel(), child: const MyApp()));
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
