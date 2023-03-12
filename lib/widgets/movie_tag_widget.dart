import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MovieTagWidget extends StatelessWidget {
  const MovieTagWidget({
    super.key,
    required this.text,
    required this.color,
    required this.useIcon,
  });

  final String text;
  final Color color;
  final bool useIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          color: ThemeApp.black_3,
          height: 30,
          child: Center(
            child: content(),
          ),
        ),
      ),
    );
  }

  Widget content() {
    if (useIcon) {
      return Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 15,
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      );
    }
    return Text(
      text,
      style: TextStyle(
        color: color,
      ),
    );
  }
}
