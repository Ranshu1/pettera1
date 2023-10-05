import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pettera/models/models.dart';

class FetchApi {
  String apiKey = "mweSiUvSIOEmCTJlRcLeUSUQfFQ7LBQd1sXjYeJVQlaigyCEGSQ0tsjf";
  List<Photos> photos = [];
  Future<List<Photos>> getPhotos(String query) async {
    final response = await http.get(
      Uri.parse(
          "https://api.pexels.com/v1/search/?page=1&per_page=78&query=$query"),
      headers: {"Authorization": apiKey},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> photosData = data['photos'];
      photos.clear();
      photosData.forEach((element) {
        photos.add(Photos.fromJson(element));
      });
      return photos;
    } else {
      print("Failed to load photos");
      return [];
    }
  }
}
