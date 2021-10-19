import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Endpoints { items, details }

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

  String get returnApiKey => apiKey;
  String get returnApiSecret => apiSecret;
}
