import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/custom_text.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/list_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/molecules/list_view_item.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  static var listItems = [

  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListViewItem(items: [
        ListItem(
            icon: const Icon(Icons.home),
            title: "Home",
          onTap: () {
            Navigator.pushNamed(context, "/");
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
