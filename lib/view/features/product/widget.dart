import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp70,
      height: dp70,
      margin: const EdgeInsets.only(right: dp16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dp16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class InterestItem extends StatelessWidget {
  const InterestItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: dp16,
            height: dp16,
            margin: const EdgeInsets.only(right: dp6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(checkCircle),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: blackTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
