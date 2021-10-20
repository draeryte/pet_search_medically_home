import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:pet_search_medically_home/model/favorite.dart';
import 'package:pet_search_medically_home/views/components/results_list.dart';
import 'package:pet_search_medically_home/views/home.dart';
import 'package:provider/provider.dart';

void main() {
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

    final textFieldForSearch = find.byKey(const Key("Search Field"));
    final searchButton = find.byKey(const Key("Search Button"));

    expect(
        (tester.widget(find.byKey(const Key("Drop Down Button")))
                as DropdownButton)
            .value,
        equals('type'));
    await tester.tap(find.text("type"));
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.text('gender').last);
    await tester.pump(const Duration(seconds: 2));
    expect(
        (tester.widget(find.byKey(const Key("Drop Down Button")))
                as DropdownButton)
            .value,
        equals('gender'));
    await tester.enterText(textFieldForSearch, "Male");
    await tester.pump();
    await tester.tap(searchButton);
    await tester.pump();
    expect(find.byKey(const Key("Pet List Home")), findsOneWidget);
  });
}
