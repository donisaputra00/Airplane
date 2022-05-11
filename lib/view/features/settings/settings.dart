import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(state.error),
          ),
        );
      } else if (state is AuthInitial) {
        context.read<PageCubit>().setPage(0);
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      }
    }, builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Center(
        child: ButtonSubmit(
          title: 'Sign Out',
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          width: dp220,
        ),
      );
    });
  }
}
