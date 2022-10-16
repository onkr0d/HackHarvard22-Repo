import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

/// This class contains miscellaneous network-related functions.
class NetworkMisc {
  // yeah this is a temp tunnel url
  static const String _url = 'http://49d2-128-197-29-237.ngrok.io';

  /// Send the users' image to be analyzed by the emotion detecting model.
  ///
  /// Sends a multipart request to our flask backend, which will interact
  /// with Rishi's emotion detection model.
  static void sendImage(imageFile) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$_url/image'));

    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path,
          contentType: MediaType('image', 'jpeg')),
    );

    http.StreamedResponse r = await request.send();
    print(r.statusCode);
    print(await r.stream.transform(utf8.decoder).join());
  }
}
