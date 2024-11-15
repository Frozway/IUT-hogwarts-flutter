import 'package:json_annotation/json_annotation.dart';

part 'house.g.dart';

@JsonSerializable()
class House {
  final String name;

  House({required this.name});

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}