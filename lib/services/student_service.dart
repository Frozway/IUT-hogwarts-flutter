import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lefrancois_thibaut_y2_flutter/models/student/student.dart';

class StudentService {
  static const String _baseUrl = 'https://hogwarts-api-univ-lr.azurewebsites.net/hogwarts/students/';

  Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Student> students = jsonList.map((json) => Student.fromJson(json)).toList();
      return students.where((student) => student.house == 'Gryffindor').toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}