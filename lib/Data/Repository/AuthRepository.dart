import 'package:signup/Data/Methods/AuthMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup/Data/Models/UserX_Model.dart';

class AuthRepository {
  AuthMethods? _methods = AuthMethods();

  Future<User?> getCurrentUser() => _methods!.getCurrentUser();

  Future<bool> authenticateUser(User user) => _methods!.authenticateUser(user);

  Future<User?> signInWithGoogle() => _methods!.signInWithGoogle();

  Future<UserX?> getUserDetails() => _methods!.getUserDetails();

  Future<void> addDataToDb(
          User currentUser, String dob, int age, bool isEmail, String name) =>
      _methods!.addDataToDb(currentUser, dob, age, isEmail, name);

  Future<User?> signUp(String email, String password, String name) =>
      _methods!.signUp(email, password, name);

  Future<User?> signIn(String email, String password) =>
      _methods!.signIn(email, password);

  Future<void> signOut() => _methods!.signOut();
}
