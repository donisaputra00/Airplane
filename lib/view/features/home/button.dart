import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtomNavWidget extends StatelessWidget {
  const CustomButtomNavWidget({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imageUrl,
            width: dp24,
            height: dp24,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : greyColor,
          ),
          Container(
            width: dp30,
            height: dp2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : transparentColor,
              borderRadius: BorderRadius.circular(dp18),
            ),
          ),
        ],
      ),
    );
  }
}
