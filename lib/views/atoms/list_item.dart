import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/custom_text.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap
  });

  final Icon icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: CustomText(text: title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
