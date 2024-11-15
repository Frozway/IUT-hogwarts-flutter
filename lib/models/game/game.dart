import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  final String? id;
  final String tournament;
  final String date;
  final String homeTeam;
  final String awayTeam;
  final int? homeScore;
  final int? awayScore;

  Game({
    this.id,
    required this.tournament,
    required this.date,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}