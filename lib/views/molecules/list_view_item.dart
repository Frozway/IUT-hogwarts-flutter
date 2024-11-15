import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/list_item.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.items, this.header});
  final List<ListItem> items;
  final DrawerHeader? header;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (header != null) SizedBox(
          height: 150,
          child: header,
        ),
        for (var item in items) item,
      ],
    );
  }
}
