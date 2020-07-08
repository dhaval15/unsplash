import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'models.dart';

const CLIENT_KEY = 'p1L3Ml8jtaWu4HalZjdf1ag07k_1ujN3YJb5QbTK3ZY';
const COLLECTIONS_API = 'https://api.unsplash.com/collections/{col}/photos';

class UnSplashApi {
  static Future<List<Photo>> getPhotos(UnSplashRequest request) async {
    try {
      final response = await http.get(request.toUrl());
      if (response.statusCode == 200) {
        List records = convert.jsonDecode(response.body);
        return records.map((record) => Photo.fromJson(record)).toList();
      }
      throw 'Something went wrong, restart app';
    } catch (SocketException) {
      throw 'No Network';
    }
  }
}

class UnSplashRequest {
  final String clientKey;
  final int page;
  final int perPage;
  final String collection;

  UnSplashRequest({
    this.clientKey = CLIENT_KEY,
    this.page = 0,
    this.collection,
    this.perPage = 20,
  });

  String toUrl() {
    final buffer = StringBuffer();
    buffer.write(COLLECTIONS_API.replaceFirst('{col}', collection));
    buffer.write('?client_id=$clientKey&page=$page&per_page=$perPage');
    return buffer.toString();
  }
}
