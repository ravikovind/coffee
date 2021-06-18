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

  Future<User?> signUpWithEmailPassword(String email, String password, String name) =>
      _methods!.signUpWithEmailPassword(email, password, name);

  Future<User?> signInWithEmailPassword(String email, String password) =>
      _methods!.signInWithEmailPassword(email, password);

  Future<void> signOut() => _methods!.signOut();
}
