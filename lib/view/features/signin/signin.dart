import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(
    text: '',
  );
  final TextEditingController passwordController = TextEditingController(
    text: '',
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: transparentColor,
        systemNavigationBarColor: transparentColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    Widget header() {
      return Text(
        'Sign In with\nyour existing account',
        style: blackTextStyle.copyWith(
          fontSize: dp24,
          fontWeight: semiBold,
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextForm(
          title: 'Email Address',
          hintText: 'Your Email Address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextForm(
          title: 'Password',
          hintText: 'Your Password',
          obsecureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.only(top: dp20),
                  child: const CircularProgressIndicator(),
                ),
              );
            }
            return ButtonSubmit(
              margin: const EdgeInsets.only(top: dp20),
              title: 'Sign In',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(
          top: dp50,
          bottom: dp50,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: dp20,
          vertical: dp30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dp18),
          color: whiteColor,
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: dp30,
          ),
          child: Text(
            'Don\'t have an account? Sign Up',
            style: greyTextStyle.copyWith(
              fontSize: dp16,
              fontWeight: medium,
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: dp24,
          vertical: dp100,
        ),
        children: [
          header(),
          inputSection(),
          signUpButton(),
        ],
      ),
    );
  }
}
