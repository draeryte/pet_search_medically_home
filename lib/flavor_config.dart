import 'package:flutter/material.dart';

class FlavorConfig extends ChangeNotifier {
  String appTitle;
  String? apiEndpoint;
  String apiKey;
  String apiSecret;

  FlavorConfig(
      {this.apiEndpoint,
      required this.appTitle,
      required this.apiKey,
      required this.apiSecret});
}
