import 'package:airplane/controller/cubit/transaction_cubit.dart';
import 'package:airplane/resources/features/transaction_card.dart';
import 'package:airplane/resources/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return Center(
              child: Text(
                'Not Found',
                style: redTextStyle.copyWith(fontSize: dp30),
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(
                right: defaultMargin,
                left: defaultMargin,
                bottom: dp100,
              ),
              itemCount: state.transactions.length,
              itemBuilder: ((context, index) {
                return TransactionCardCustom(
                  state.transactions[index],
                );
              }),
            );
          }
        } else {
          return Center(
              child: Text(
            '404 | Server Error',
            style: redTextStyle.copyWith(fontSize: dp30),
          ));
        }
      },
    );
  }
}
