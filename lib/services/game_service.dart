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

  Future<List<Game>> fetchUpcomingGames() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Game> games = jsonList.map((json) => Game.fromJson(json)).toList();
      return games.where((game) => game.homeScore == null && game.awayScore == null).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<void> deleteGame(String tournament, String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$tournament/matches/$id'));

    // if (response.statusCode != 200) {
    //   throw Exception('Failed to delete game');
    // }
  }

  Future<void> addGame(Game game) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(game.toJson()),
    );

    // if (response.statusCode != 201) {
    //   throw Exception('Failed to add game');
    // }
  }
}