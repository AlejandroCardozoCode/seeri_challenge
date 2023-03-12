import 'package:flutter/material.dart';
import 'package:seeri/theme/theme.dart';

class CustomMovieAppWidget extends StatelessWidget {
  final String bannerImage;
  const CustomMovieAppWidget({super.key, required this.bannerImage});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeApp.black_2,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
          background: Image(
        image: NetworkImage(bannerImage),
        fit: BoxFit.fitWidth,
      )),
    );
  }
}
