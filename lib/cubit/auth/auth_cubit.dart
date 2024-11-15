import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lefrancois_thibaut_y2_flutter/models/user/user.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit() : super(null) {
    _loadUser();
  }

  Future<void> login(String username, String password) async {
    // Simulate a login process
    final user =
        User(username: username, password: password, house: 'Gryffindor');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', user.username);
    await prefs.setString('password', user.password);
    await prefs.setString('house', user.house ?? '');
    emit(user);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    await prefs.remove('house');
    emit(null);
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    final house = prefs.getString('house');
    if (username != null && password != null) {
      emit(User(username: username, password: password, house: house));
    }
  }

  Color getHouseColor() {
    final user = state;
    if (user == null) return Colors.deepPurple; // Default color
    switch (user.house) {
      case 'Gryffindor':
        return Colors.red;
      case 'Hufflepuff':
        return Colors.yellow;
      case 'Ravenclaw':
        return Colors.blue;
      case 'Slytherin':
        return Colors.green;
      default:
        return Colors.deepPurple; // Default color
    }
  }
}
