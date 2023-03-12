import 'package:flutter/material.dart';
import 'package:seeri/theme/theme.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String tittle;
  final bool useIcon;
  final Icon icon = const Icon(Icons.account_circle);

  const AppBarWidget({super.key, required this.tittle, required this.useIcon});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(tittle),
      backgroundColor: ThemeApp.black_1,
      elevation: 0,
      actions: [
        getActions(),
      ],
    );
  }

  Widget getActions() {
    if (useIcon) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      );
    } else {
      return (Container());
    }
  }
}
