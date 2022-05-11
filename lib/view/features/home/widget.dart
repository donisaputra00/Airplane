import 'package:airplane/models/destination.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:airplane/view/features/product/product.dart';
import 'package:flutter/material.dart';

class PopulerCard extends StatelessWidget {
  const PopulerCard(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    if (destinationModel.rating >= 4.8) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProduct(destinationModel),
            ),
          );
        },
        child: Container(
          width: dp200,
          height: dp323,
          margin: const EdgeInsets.only(left: defaultMargin),
          padding: const EdgeInsets.all(dp10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(dp16),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: dp180,
                height: dp220,
                margin: const EdgeInsets.only(bottom: dp20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      destinationModel.imageUrl,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(dp16),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: dp55,
                    height: dp30,
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(dp16),
                      ),
                    ),
                    child: Row(
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
                          destinationModel.rating.toString(),
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: dp10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destinationModel.name,
                      style: blackTextStyle.copyWith(
                        fontSize: dp18,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      destinationModel.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

class DestinationTile extends StatelessWidget {
  const DestinationTile(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(destinationModel),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: dp16,
        ),
        padding: const EdgeInsets.all(dp10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(dp16),
        ),
        child: Row(
          children: [
            Container(
              width: dp70,
              height: dp70,
              margin: const EdgeInsets.only(right: dp16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp16),
                image: DecorationImage(
                  image: NetworkImage(destinationModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinationModel.name,
                    style: blackTextStyle.copyWith(
                      fontSize: dp18,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    destinationModel.city,
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
                  destinationModel.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
