import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.title,
    required this.hintText,
    this.obsecureText = false,
    required this.controller,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: dp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle,
          ),
          const SizedBox(
            height: dp6,
          ),
          TextFormField(
            obscureText: obsecureText,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: dp12,
                horizontal: dp16,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: redColor),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: redColor),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
