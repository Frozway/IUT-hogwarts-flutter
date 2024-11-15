import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/services/house_service.dart';

import '../../cubit/auth/auth_cubit.dart';
import '../../models/house/house.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedHouse;
  List<House> houses = [];

  @override
  void initState() {
    super.initState();
    _loadHouses();
  }

  Future<void> _loadHouses() async {
    try {
      final fetchedHouses = await HouseService().fetchHouses();
      setState(() {
        houses = fetchedHouses;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedHouse,
              hint: const Text('Select House'),
              items: houses.map((House house) {
                return DropdownMenuItem<String>(
                  value: house.name,
                  child: Text(house.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedHouse = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                context.read<AuthCubit>().login(username, password);
                Navigator.pushReplacementNamed(context, '/student');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}