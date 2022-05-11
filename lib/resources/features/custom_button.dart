import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.background = primaryColor,
  }) : super(key: key);

  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: dp55,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: background,
          primary: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: dp18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
