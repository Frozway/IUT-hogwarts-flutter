import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lefrancois_thibaut_y2_flutter/models/house/house.dart';

class HouseService {
  static const String _housesUrl = 'https://hogwarts-api-univ-lr.azurewebsites.net/hogwarts/houses/';

  Future<List<House>> fetchHouses() async {
    final response = await http.get(Uri.parse(_housesUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => House.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load houses');
    }
  }
}