import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Coordinates> fetchCoordinates() async {

  final response = await http
      .get(Uri.parse('https://api.apple-mapkit.com/v1/reverseGeocode?'
      'loc=42.347704%2C-71.118095&lang=en-US'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Coordinates.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Status Overload');

  }
}

class Coordinates {

  final int longAndLat;
  final String language;

  const Coordinates({
    required this.longAndLat,
    required this.language,
  });
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      longAndLat: json['Longitude and Latitude'],
      language: json['Language of Region:'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Coordinates> futureCoordinates;

  @override
  void initState() {
    super.initState();
    futureCoordinates = fetchCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
      ),
    );
  }
}