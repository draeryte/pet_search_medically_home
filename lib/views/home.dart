import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/controller/services/token_api.dart';
import 'package:pet_search_medically_home/controller/services/secure_storage_services.dart';
import 'package:pet_search_medically_home/model/animal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchByOption = '';
  TextEditingController searchField = TextEditingController();
  bool searchEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Please select a search option'),
              value: searchByOption,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onTap: () async {
                String? token =
                    await SecureStorage.secureStorage.read(key: "accessToken");
                if (token != null) {
                } else {
                  getAccessToken();
                }
              },
              onChanged: (String? newValue) {
                setState(() {
                  searchByOption = newValue!;
                  searchEnabled = true;
                });
              },
              items: <String>['', 'Type', 'Color', 'Gender', 'Breed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            searchEnabled
                ? TextField(
                    controller: searchField,
                  )
                : Container(),
            searchEnabled
                ? OutlinedButton(onPressed: () {}, child: const Text('Search'))
                : Container(),
          ],
        ),
      ),
    );
  }
}
