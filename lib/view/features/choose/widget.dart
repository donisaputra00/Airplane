import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    Key? key,
    required this.isAvailable,
    required this.id,
  }) : super(key: key);

  // NOTE: 1. Available 2. Selected 3. Unavailable
  final bool isAvailable;
  final String id;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    Color backgroundColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        if (isSelected) {
          return primaryColor;
        } else {
          return availableColor;
        }
      }
    }

    Color borderColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        return primaryColor;
      }
    }

    SingleChildRenderObjectWidget child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: dp48,
        height: dp48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(dp14),
          border: Border.all(
            color: borderColor(),
          ),
        ),
        child: child(),
      ),
    );
  }
}

class SeatReady extends StatelessWidget {
  const SeatReady({
    Key? key,
    this.seatA = true,
    this.seatB = true,
    required this.seatLength,
    this.seatC = true,
    this.seatD = true,
    required this.data,
  }) : super(key: key);

  final bool seatA;
  final bool seatB;
  final int seatLength;
  final bool seatC;
  final bool seatD;
  final int data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: dp16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SeatItem(
            id: 'A' + data.toString(),
            isAvailable: seatA,
          ),
          SeatItem(
            isAvailable: seatB,
            id: 'B' + data.toString(),
          ),
          SizedBox(
            width: dp48,
            height: dp48,
            child: Center(
              child: Text(
                seatLength.toString(),
                style: greyTextStyle.copyWith(
                  fontSize: dp16,
                ),
              ),
            ),
          ),
          SeatItem(
            isAvailable: seatC,
            id: 'C' + data.toString(),
          ),
          SeatItem(
            isAvailable: seatD,
            id: 'D' + data.toString(),
          ),
        ],
      ),
    );
  }
}
