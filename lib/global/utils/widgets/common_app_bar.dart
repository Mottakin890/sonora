import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? action;
  const CommonAppBar({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
