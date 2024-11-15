// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as String?,
      tournament: json['tournament'] as String,
      date: json['date'] as String,
      homeTeam: json['homeTeam'] as String,
      awayTeam: json['awayTeam'] as String,
      homeScore: (json['homeScore'] as num?)?.toInt(),
      awayScore: (json['awayScore'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'tournament': instance.tournament,
      'date': instance.date,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'homeScore': instance.homeScore,
      'awayScore': instance.awayScore,
    };
