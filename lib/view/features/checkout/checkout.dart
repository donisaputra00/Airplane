import 'package:airplane/controller/controller.dart';
import 'package:airplane/controller/cubit/transaction_cubit.dart';
import 'package:airplane/models/models.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: dp50),
        child: Column(
          children: [
            Container(
              width: dp291,
              height: dp65,
              margin: const EdgeInsets.only(bottom: dp10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(checkout),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: dp24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                        fontSize: dp24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: dp30),
        padding: const EdgeInsets.symmetric(
          horizontal: dp20,
          vertical: dp30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dp16),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: DESTINATION TILE
            Row(
              children: [
                Container(
                  width: dp70,
                  height: dp70,
                  margin: const EdgeInsets.only(right: dp16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage(transaction.destinationModel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(dp16),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destinationModel.name,
                        style: blackTextStyle.copyWith(
                          fontSize: dp18,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        transaction.destinationModel.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: dp20,
                      height: dp20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(star),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: dp2,
                    ),
                    Text(
                      transaction.destinationModel.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // NOTE: BOOKING DETAILS TITLE
            Container(
              margin: const EdgeInsets.only(top: dp20),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontSize: dp16,
                  fontWeight: semiBold,
                ),
              ),
            ),

            // NOTE: BOOKING DETAILS ITEM
            BookDetails(
              name: 'Traveler',
              value: transaction.amountOfTraveler.toString() + ' Person',
            ),
            BookDetails(
              name: 'Seat',
              value: transaction.selectedSeats,
            ),
            BookDetails(
              name: 'Insurance',
              value: transaction.insurance ? 'YES' : 'NO',
              color: transaction.insurance ? greenColor : redColor,
            ),
            BookDetails(
              name: 'Refundable',
              value: transaction.refundable ? 'YES' : 'NO',
              color: transaction.refundable ? greenColor : redColor,
            ),
            BookDetails(
              name: 'VAT',
              value: (transaction.vat * 100).toStringAsFixed(0) + '%',
            ),
            BookDetails(
              name: 'Price',
              value: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.price),
            ),
            BookDetails(
              name: 'Grand Total',
              value: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              color: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: dp30),
              padding: const EdgeInsets.symmetric(
                horizontal: dp20,
                vertical: dp30,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(dp16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: dp16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: dp16),
                    child: Row(
                      children: [
                        Container(
                          width: dp100,
                          height: dp70,
                          margin: const EdgeInsets.only(right: dp16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(dp16),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(card),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: dp24,
                                  height: dp24,
                                  margin: const EdgeInsets.only(right: dp6),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(airplane),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: dp16,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                  fontSize: dp18,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Current Balance',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/success',
              (route) => false,
            );
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(
              child: Container(
                margin: const EdgeInsets.only(top: dp30),
                child: const CircularProgressIndicator(),
              ),
            );
          }

          return ButtonSubmit(
            title: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            margin: const EdgeInsets.only(top: dp30),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: dp30),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
            fontSize: dp16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payButton(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
