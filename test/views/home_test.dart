import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:pet_search_medically_home/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  String searchByOption = 'type';
  TextEditingController searchField = TextEditingController();
  bool searchEnabled = false;
  bool showResults = false;
  List animals = [];

  testWidgets('Given when user attempts to search for a pet', (tester) async {
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
          home: MyHomePage(),
        )));

    final dropDown = find.byType(DropdownButton);
    final textFieldForSearch = find.byKey(const Key("Search Term"));
    final searchButton = find.byType(TextButton);

    await tester.enterText(textFieldForSearch, "Hey");
    await tester.pump();
  });
}
