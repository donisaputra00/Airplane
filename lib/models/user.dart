import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.hobby = '',
    this.balance = 0,
    this.createdAt = '11 Mei 2020',
  });

  final String id;
  final String name;
  final String email;
  final String hobby;
  final int balance;
  final String createdAt;

  @override
  List<Object?> get props => [id, name, email, hobby, balance, createdAt];
}
