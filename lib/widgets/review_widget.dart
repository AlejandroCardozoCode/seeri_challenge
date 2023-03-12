import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:seeri/theme/theme.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.imageUrl, required this.userName, required this.rate, required this.review});
  final String imageUrl;
  final String userName;
  final String rate;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Text(
                    rate,
                    style: const TextStyle(color: Colors.yellow),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
          subtitle: ReadMoreText(
            review,
            lessStyle: TextStyle(color: ThemeApp.blue),
            moreStyle: TextStyle(color: ThemeApp.blue),
            trimCollapsedText: " Ver mas",
            trimExpandedText: " Ver menos",
            trimLength: 100,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 70, right: 10),
          child: Divider(
            height: 3,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
