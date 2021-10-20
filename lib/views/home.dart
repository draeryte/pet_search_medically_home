import 'package:flutter/material.dart';
import 'package:pet_search_medically_home/flavor_config.dart';
import 'package:provider/provider.dart';
import 'package:pet_search_medically_home/controller/services/token_api.dart';
import 'package:http/http.dart' as http;
import 'package:pet_search_medically_home/views/components/custom_text_field.dart';
import 'package:pet_search_medically_home/views/components/go_to_fav_button.dart';
import 'package:pet_search_medically_home/views/components/results_list.dart';
import 'package:pet_search_medically_home/views/components/shaped_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    getAccessToken(context.read<FlavorConfig>().apiKey,
        context.read<FlavorConfig>().apiSecret, http.Client());
  }

  String searchByOption = 'type';
  TextEditingController searchField = TextEditingController();
  bool searchEnabled = false;
  bool showResults = false;
  List animals = [];
  FocusNode textFocus = FocusNode();
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
        child: Column(
          children: [
            ShapedContainer(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('Search by'),
                  value: searchByOption,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      searchByOption = newValue!;
                      searchEnabled = true;
                    });
                  },
                  items: <String>['type', 'color', 'gender', 'breed']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              key: const Key('Search Field'),
              searchField: searchField,
              labelText: 'Type search here',
            ),
            const SizedBox(
              height: 10,
            ),
            ShapedContainer(
              child: TextButton(
                  onPressed: () async {
                    setState(() {
                      showResults = true;
                    });
                  },
                  child: const Text('Search')),
            ),
            showWidget(
                showResults,
                ResultsList(
                  searchByOption: searchByOption,
                  searchField: searchField,
                )),
          ],
        ),
      ),
    );
  }
}

Widget showWidget(bool show, Widget widgetToShow) {
  if (show == true) {
    return widgetToShow;
  } else {
    return Container();
  }
}
