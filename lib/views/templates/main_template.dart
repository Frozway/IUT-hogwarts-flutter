import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../models/user/user.dart';
import '../organisms/menu.dart';

class MainTemplate extends StatelessWidget {
  const MainTemplate({super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4090FF),
        title: BlocBuilder<AuthCubit, User?>(
          builder: (context, user) {
            return Text(user != null ? '${user.username} ${user.house}' : title);
          },
        ),
      ),
      drawer: const Menu(),
      body: Center(
        child: body,
      ),
    );
  }
}