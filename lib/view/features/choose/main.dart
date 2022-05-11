import 'package:airplane/controller/controller.dart';
import 'package:airplane/models/models.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:airplane/view/features/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'widget.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: dp30),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: dp24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: dp30),
        child: Row(
          children: [
            // NOTE : AVAILABLE
            Container(
              width: dp16,
              height: dp16,
              margin: const EdgeInsets.only(right: dp6),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(available),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),

            // NOTE : SELECTED
            Container(
              width: dp16,
              height: dp16,
              margin: const EdgeInsets.only(
                right: dp6,
                left: dp10,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selected),
                ),
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),

            // NOTE : UNAVAILABLE
            Container(
              width: dp16,
              height: dp16,
              margin: const EdgeInsets.only(
                right: dp6,
                left: dp10,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(unavailable),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: dp30),
            padding: const EdgeInsets.symmetric(
              vertical: dp30,
              horizontal: dp22,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dp16),
              color: whiteColor,
            ),
            child: Column(
              children: [
                // NOTE: SEAT INDICATOR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: dp48,
                      height: dp48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(
                            fontSize: dp16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dp48,
                      height: dp48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(
                            fontSize: dp16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dp48,
                      height: dp48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(
                            fontSize: dp16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dp48,
                      height: dp48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(
                            fontSize: dp16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dp48,
                      height: dp48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(
                            fontSize: dp16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // NOTE: SEAT
                const SeatReady(
                  data: 1,
                  seatLength: 1,
                ),
                const SeatReady(
                  data: 2,
                  seatLength: 2,
                ),
                const SeatReady(
                  data: 3,
                  seatLength: 3,
                  seatD: false,
                ),
                const SeatReady(
                  data: 4,
                  seatLength: 4,
                ),
                const SeatReady(
                  data: 5,
                  seatLength: 5,
                ),

                // NOTE: YOUR SEAT
                Container(
                  margin: const EdgeInsets.only(top: dp30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      const SizedBox(
                        width: dp4,
                      ),
                      Expanded(
                        child: Text(
                          state.join(', '),
                          textAlign: TextAlign.end,
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: dp16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // NOTE: TOTAL
                Container(
                  margin: const EdgeInsets.only(top: dp16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destinationModel.price),
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: dp16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return ButtonSubmit(
              title: 'Continue to Checkout',
              margin: const EdgeInsets.only(
                top: dp30,
                bottom: dp46,
              ),
              onPressed: () {
                int price = destinationModel.price * state.length;
                double vat = 0.45;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      TransactionModel(
                        destinationModel: destinationModel,
                        amountOfTraveler: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: vat,
                        price: price,
                        grandTotal: price + (price * vat).toInt(),
                        createdAt: '12 Mei 2000',
                      ),
                    ),
                  ),
                );
              },
            );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: dp24,
          ),
          children: [
            title(),
            seatStatus(),
            selectSeat(),
            checkoutButton(),
          ],
        ),
      ),
    );
  }
}
