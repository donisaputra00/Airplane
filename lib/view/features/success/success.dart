import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width(context) / 1.2,
              height: width(context) / 1.2 / 2,
              margin: const EdgeInsets.only(bottom: dp80),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(success),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontSize: dp32,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: dp10),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: greyTextStyle.copyWith(
                fontSize: dp16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            ButtonSubmit(
              title: 'My Bookings',
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              width: dp220,
              margin: const EdgeInsets.only(top: dp50),
            ),
          ],
        ),
      ),
    );
  }
}
