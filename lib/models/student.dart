import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  final String id;
  final String lastName;
  final String firstName;
  final String house;
  final String? dateOfBirth;
  final String picture;

  Student({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.house,
    this.dateOfBirth,
    required this.picture,
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}