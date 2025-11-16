import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData leading;
  final IconData trailing;
  final void Function()? onTap;
  const ProfileCard({
    super.key,
    required this.title,
    required this.leading,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(leading),
        title: Text(title, style: context.myTextTheme.titleSmall),
        trailing: Icon(trailing),
      ),
    );
  }
}
