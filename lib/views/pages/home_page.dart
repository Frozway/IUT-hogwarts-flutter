import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/templates/main_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTemplate(
        title: "Home",
        body: Center(
          child: Text("Welcome to the home page"),
        )
    );
  }
}
