import 'package:airplane/controller/controller.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return SafeArea(
            child: Center(
              child: Container(
                width: dp300,
                height: dp211,
                padding: const EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(card),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.5),
                      blurRadius: dp50,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              ),
                              Text(
                                state.user.name,
                                style: whiteTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: dp20,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
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
                    const SizedBox(
                      height: dp40,
                    ),
                    Text(
                      'Balance',
                      style: whiteTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'IDR ',
                        decimalDigits: 0,
                      ).format(state.user.balance),
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: dp26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
