import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lefrancois_thibaut_y2_flutter/models/game/game.dart';

class GameService {
  static const String _baseUrl = 'https://hogwarts-api-univ-lr.azurewebsites.net/quidditch/j-doe/matches/';

  Future<List<Game>> fetchCompletedGames() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Game> games = jsonList.map((json) => Game.fromJson(json)).toList();
      return games.where((game) => game.homeScore != null && game.awayScore != null).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }
}