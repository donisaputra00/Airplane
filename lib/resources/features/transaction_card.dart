import 'package:airplane/models/models.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:airplane/view/features/checkout/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCardCustom extends StatelessWidget {
  const TransactionCardCustom(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: dp10),
      padding: const EdgeInsets.all(dp20),
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
                    image: NetworkImage(transaction.destinationModel.imageUrl),
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
          Container(
            margin: const EdgeInsets.only(top: dp16),
            child: Row(
              children: [
                Container(
                  width: dp16,
                  height: dp16,
                  margin: const EdgeInsets.only(right: dp6),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(checkCircle),
                    ),
                  ),
                ),
                Text(
                  'Created At',
                  style: blackTextStyle,
                ),
                const SizedBox(
                  width: dp4,
                ),
                Expanded(
                  child: Text(
                    transaction.createdAt,
                    textAlign: TextAlign.end,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      color: redColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
