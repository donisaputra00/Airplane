import 'package:airplane/models/destination.dart';
import 'package:airplane/resources/features/features.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:airplane/view/features/choose/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widget.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: dp450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(destinationModel.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: dp450 / 2,
        margin: const EdgeInsets.only(top: dp450 / 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0),
              blackColor.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        padding: const EdgeInsets.only(top: dp30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // NOTE : EMBLEM
              Container(
                width: double.infinity,
                height: dp24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(emblem),
                  ),
                ),
              ),

              // NOTE : TITLE
              Container(
                margin: const EdgeInsets.only(
                  top: dp256,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destinationModel.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: dp24,
                              fontWeight: semiBold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            destinationModel.city,
                            style: whiteTextStyle.copyWith(
                              fontSize: dp16,
                              fontWeight: light,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: dp4,
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
                          width: dp4,
                        ),
                        Text(
                          destinationModel.rating.toString(),
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // NOTE : DESCRIPTION
              Container(
                width: double.infinity,
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
                    // NOTE : ABOUT
                    Text(
                      'About',
                      style: blackTextStyle.copyWith(
                        fontSize: dp16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: dp6,
                    ),
                    Text(
                      destinationModel.about,
                      style: blackTextStyle,
                    ),

                    // NOTE : PHOTOS
                    const SizedBox(
                      height: dp20,
                    ),
                    Text(
                      'Photos',
                      style: blackTextStyle.copyWith(
                        fontSize: dp16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: dp6,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: destinationModel.photos!.map((photo) {
                          return PhotoItem(imageUrl: photo);
                        }).toList(),
                      ),
                    ),

                    // NOTE : INTERESTS
                    const SizedBox(
                      height: dp20,
                    ),
                    Text(
                      'Interests',
                      style: blackTextStyle.copyWith(
                        fontSize: dp16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: dp6,
                    ),
                    Row(
                      children: [
                        InterestItem(
                          text: destinationModel.interests![0],
                        ),
                        InterestItem(
                          text: destinationModel.interests![1],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: dp6,
                    ),
                    Row(
                      children: [
                        InterestItem(
                          text: destinationModel.interests![2],
                        ),
                        InterestItem(
                          text: destinationModel.interests![3],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // NOTE : PRICE & BOOK BUTTON
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: dp30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(destinationModel.price),
                            style: blackTextStyle.copyWith(
                              fontSize: dp18,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            'per orang',
                            style: blackTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonSubmit(
                      title: 'Book Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChooseSeatPage(destinationModel),
                          ),
                        );
                      },
                      width: dp170,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          customShadow(),
          content(),
        ],
      ),
    );
  }
}
