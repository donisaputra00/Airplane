import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(
    text: '',
  );
  final TextEditingController emailController = TextEditingController(
    text: '',
  );
  final TextEditingController passwordController = TextEditingController(
    text: '',
  );
  final TextEditingController hobbyController = TextEditingController(
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
        'Join us and get\nyour next journey',
        style: blackTextStyle.copyWith(
          fontSize: dp24,
          fontWeight: semiBold,
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextForm(
          title: 'Full Name',
          hintText: 'Your Full Name',
          controller: nameController,
        );
      }

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

      Widget hobbyInput() {
        return CustomTextForm(
          title: 'Hobby',
          hintText: 'Your Hobby',
          controller: hobbyController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
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
              title: 'Get Started',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      hobby: hobbyController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: dp30),
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
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: dp40,
            bottom: dp55,
          ),
          child: Text(
            'Have an account? Sign In',
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: dp24,
            vertical: dp30,
          ),
          children: [
            header(),
            inputSection(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
