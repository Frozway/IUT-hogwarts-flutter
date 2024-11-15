import 'package:flutter/material.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/custom_text.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.imageUrl
  });

  final Icon? icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (imageUrl != null && imageUrl!.isNotEmpty)
          ? CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
      )
          : icon ?? const Icon(Icons.school),
      title: CustomText(text: title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}

