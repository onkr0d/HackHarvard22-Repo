import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:music_app/components/song_item.dart';

/// This class contains miscellaneous network-related functions.
class NetworkMisc {
  // yeah this is a temp tunnel url
  static const String _url = 'http://15ec-128-197-29-237.ngrok.io';

  /// Send the users' image to be analyzed by the emotion detecting model.
  ///
  /// Sends a multipart request to our flask backend, which will interact
  /// with Rishi's emotion detection model.
  static Future<String> sendImage(imageFile) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$_url/analyzeEmotions'));

    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path,
          contentType: MediaType('image', 'jpeg')),
    );

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    return Future<String>.value(response.stream.transform(utf8.decoder).join());
  }

  static Future<SongItem> findSongByQuery(mood) async {
    http.Response response = await http.post(Uri.parse('$_url/searchbymood'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'mood': mood,
        }));

    // print(response.statusCode);
    // print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);

    return SongItem(json['title'], json['cover'], json['artist']);
  }

  static Future<String> findCity() async {
    var response = await http.get(Uri.parse('$_url/findcity'));
    return Future<String>.value(response.body);
  }
}
