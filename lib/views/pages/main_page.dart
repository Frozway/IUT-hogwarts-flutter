import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/pages/game/completed_game_page.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/pages/game/upcoming_game_page.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/pages/student_page.dart';

import '../../cubit/auth/auth_cubit.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const LoginPage(),
          '/student': (context) => const StudentsPage(),
          '/game/completed': (context) => const CompletedGamePage(),
          '/game/upcoming': (context) => const UpcomingGamePage(),
        },
      ),
    );
  }
}
