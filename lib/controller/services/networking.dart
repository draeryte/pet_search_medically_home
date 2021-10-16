import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_search_medically_home/constants.dart';

Future getAccessToken() async {
  Map<String, String> header = {
    "Content-Type": "application/x-www-form-urlencoded"
  };
  // var body = json.encode(<String, String>{
  //   "grant_type": "client_credentials",
  //   "client_id": dotenv.env['API_KEY']!,
  //   "client_secret": dotenv.env['CLIENT_SECRET']!
  // });
  Map<String, String> body = {
    "grant_type": "client_credentials",
    "client_id": dotenv.env['API_KEY']!,
    "client_secret": dotenv.env['CLIENT_SECRET']!
  };

  try {
    var res = await http.post(Uri.parse(url!), body: body, headers: header);

    if (res.statusCode == 200) {
      //  var json = jsonDecode(res.body);
      var jsonData = json.decode(res.body);
      String token = jsonData['access_token'];
      log(token);
      return token;
    } else {
      return res.statusCode;
    }
  } catch (e) {
    return null;
  }
}
