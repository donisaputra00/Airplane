import 'package:airplane/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        hobby: hobby,
        balance: 280000000,
        createdAt: '12 Mei 2000',
      );

      await UserService().setUser(userModel);

      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
