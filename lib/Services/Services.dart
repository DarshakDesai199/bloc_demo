import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/NewsModel.dart';

class ApiServices {
  static Future<NewsModel?> getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=4dd344aa325a41f292b7f0fd159e32f1"));
    print("${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      return newsModelFromJson(response.body);
    }
    return null;
  }
}
