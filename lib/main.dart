import 'package:airplane/controller/controller.dart';
import 'package:airplane/controller/cubit/transaction_cubit.dart';
import 'package:airplane/view/features/bonus/bonus.dart';
import 'package:airplane/view/features/home/main.dart';
import 'package:airplane/view/features/signin/signin.dart';
import 'package:airplane/view/features/signup/signup.dart';
import 'package:airplane/view/features/started/started.dart';
import 'package:airplane/view/features/success/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) {
            User? user = FirebaseAuth.instance.currentUser;

            if (user == null) {
              return const GetStarted();
            } else {
              context.read<AuthCubit>().getCurrentUser(user.uid);
              return const MainPage();
            }
          },
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/bonus': (context) => const BonusPage(),
          '/success': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
