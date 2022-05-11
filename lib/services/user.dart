import 'package:airplane/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel userModel) async {
    try {
      await _userReference.doc(userModel.id).set({
        'email': userModel.email,
        'name': userModel.name,
        'hobby': userModel.hobby,
        'balance': userModel.balance,
        'createdAt': userModel.createdAt,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        balance: snapshot['balance'],
        createdAt: snapshot['createdAt'],
      );
    } catch (e) {
      rethrow;
    }
  } 
}
