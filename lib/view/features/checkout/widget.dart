import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.name,
    required this.value,
    this.color = blackColor,
  }) : super(key: key);

  final String name;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: dp16),
      child: Row(
        children: [
          Container(
            width: dp16,
            height: dp16,
            margin: const EdgeInsets.only(right: dp6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(checkCircle),
              ),
            ),
          ),
          Text(
            name,
            style: blackTextStyle,
          ),
          const SizedBox(
            width: dp4,
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
