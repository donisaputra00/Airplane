import 'package:airplane/models/models.dart';
import 'package:airplane/services/transaction.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transactionModel);
      emit(const TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  Future<void> fetchTransactions() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransactions();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
