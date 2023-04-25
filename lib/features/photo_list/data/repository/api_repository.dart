import 'dart:convert';

import 'package:flickr_app/features/photo_list/domain/models/photo_list_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<PhotoList?> getPhotoList({String text = '', int page = 1, int perPage = 50}) async {
    final apiUrl =
        'https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=5ee9bb983babe659d4a61f33754acc71&text=$text&safe_search=1&media=photos&extras=url_t&per_page=$perPage&page=$page&format=json&nojsoncallback=1';
    try {
      final body = await http.get(Uri.parse(apiUrl));
      final photoList = PhotoList.fromJson(
        json.decode(body.body) as Map<String, dynamic>,
      );

      return photoList;
    } catch (e) {
      rethrow;
    }
  }
}
