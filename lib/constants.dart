import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final url = dotenv.env['API_URL'];
final secret = dotenv.env['CLIENT_SECRET'];
final apiKey = dotenv.env['API_KEY'];
TextStyle infoMessageBold = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
);
