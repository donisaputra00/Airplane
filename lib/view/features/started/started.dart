import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgAirplane),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                    fontSize: dp32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: dp10,
                ),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: whiteTextStyle.copyWith(
                    fontSize: dp16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                ButtonSubmit(
                  title: 'Get Started',
                  width: dp220,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-up', (route) => true);
                  },
                  margin: const EdgeInsets.only(
                    top: dp50,
                    bottom: dp80,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
