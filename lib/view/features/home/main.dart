import 'package:airplane/controller/cubit/cubit.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/settings.dart';
import '../transaction/transaction.dart';
import '../wallet/wallet.dart';
import 'home.dart';
import 'button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: transparentColor,
        systemNavigationBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingsPage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: dp60,
          margin: const EdgeInsets.only(
            right: defaultMargin,
            left: defaultMargin,
            bottom: dp30,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                blurRadius: dp10,
                offset: const Offset(0, 10),
              ),
            ],
            color: whiteColor,
            borderRadius: BorderRadius.circular(dp18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              CustomButtomNavWidget(
                index: 0,
                imageUrl: globeActive,
              ),
              // ignore: prefer_const_constructors
              CustomButtomNavWidget(
                index: 1,
                imageUrl: book,
              ),
              // ignore: prefer_const_constructors
              CustomButtomNavWidget(
                index: 2,
                imageUrl: creditCard,
              ),
              // ignore: prefer_const_constructors
              CustomButtomNavWidget(
                index: 3,
                imageUrl: settings,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                customBottomNav(),
              ],
            ),
          ),
        );
      },
    );
  }
}
