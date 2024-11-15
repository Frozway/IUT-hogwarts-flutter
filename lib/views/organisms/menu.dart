import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/custom_text.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/list_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/molecules/list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/cubit/auth/auth_cubit.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListViewItem(items: [
        ListItem(
            icon: const Icon(Icons.school),
            title: "Gryffindor Students",
            onTap: () {
              Navigator.pushNamed(
                  context,
                  "/student"
              );
            }
        ),
        ListItem(
            icon: const Icon(Icons.sports_soccer),
            title: "Completed Games",
            onTap: () {
              Navigator.pushNamed(
                  context,
                  "/game/completed"
              );
            }
        ),ListItem(
            icon: const Icon(Icons.sports_bar),
            title: "Upcoming Games",
            onTap: () {
              Navigator.pushNamed(
                  context,
                  "/game/upcoming"
              );
            }
        ),
        ListItem(
            icon: const Icon(Icons.logout),
            title: "Logout",
            onTap: () {
              context.read<AuthCubit>().logout();
              Navigator.pushReplacementNamed(context, "/");
            }
        )
      ],
          header: const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4090FF),
              ),
              child:
              CustomText(
                  text: "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)
              )
          )
      ),
    );
  }
}