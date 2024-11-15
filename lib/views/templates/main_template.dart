import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/organisms/menu.dart';

class MainTemplate extends StatelessWidget {
  const MainTemplate({super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4090FF),
        title: Text(title),
      ),
      drawer: const Menu(),
      body: Center(
        child: body,
      ),
    );
  }
}
