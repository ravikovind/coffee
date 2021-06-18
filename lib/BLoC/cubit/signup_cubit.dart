import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void signInWithGoogle(String? dob, int? age, String? name) async {
    final AuthRepository authRepository = AuthRepository();

    emit(SignupwithgoogleLoading());
    User? user = await authRepository.signInWithGoogle();
    bool newUser = await authRepository.authenticateUser(user!);
    if (!newUser) {
      authRepository.addDataToDb(user, dob!, age!, false, name!);
    }
    emit(SignupDone());
  }

  void signUpWithEmailPassword(
    String? email,
    String? password,
    String? dob,
    int? age,
    String name,
  ) async {
    emit(SignupwithEmailPasswordLoading());
    final AuthRepository authRepository = AuthRepository();

    User? user =
        await authRepository.signUpWithEmailPassword(email!, password!, name);
    if (user != null) {
      if (!user.emailVerified) {
        bool newUser = await authRepository.authenticateUser(user);
        if (!newUser) {
          authRepository.addDataToDb(user, dob!, age!, true, name);
        }
      }
    }
    emit(SignupDone());
  }

  void signOut() async {
    emit(SignupwithgoogleLoading());
    final AuthRepository authRepository = AuthRepository();
    await authRepository.signOut();
    emit(SignOutDone());
  }
}
