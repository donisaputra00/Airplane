import 'package:airplane/models/models.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final DestinationModel destinationModel;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  final String createdAt;
  final String id;

  const TransactionModel({
    this.id = '',
    required this.destinationModel,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.createdAt = '11 Mei 2020',
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      id: id,
      destinationModel: DestinationModel.fromJson(json['destination']['id'], json['destination']),
      amountOfTraveler: json['amountOfTraveler'],
      selectedSeats: json['selectedSeats'],
      insurance: json['insurance'],
      refundable: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
      createdAt: json['createdAt'],
    );
  }

  @override
  List<Object?> get props => [
        destinationModel,
        amountOfTraveler,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
        createdAt,
      ];
}
