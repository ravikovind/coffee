import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final AuthRepository authRepository = AuthRepository();

  void signUpWithGoogle(String? dob, int? age, String? name) async {
    emit(Loading());
    User? user = await authRepository.signInWithGoogle();
    if (user != null) {
      bool newUser = await authRepository.authenticateUser(user);
      if (newUser) {
        emit(CreatingAccountState());
        authRepository.addDataToDb(user, dob!, age!, false, name!);
      }
    } else {
      emit(ErrorState());
      emit(SignupDone());
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
    emit(Loading());
    User? user =
        await authRepository.signUpWithEmailPassword(email!, password!, name);
    if (user != null) {
      emit(CreatingAccountState());
      if (!user.emailVerified) {
        authRepository.addDataToDb(user, dob!, age!, true, name);
      } else {
        await authRepository.signInWithEmailPassword(email, password);
        emit(SignupDone());
      }
    } else {
      emit(ErrorState());
      emit(SignupDone());
    }
    emit(SignupDone());
  }

  // void signInWithGoogle() async {
  //   final AuthRepository authRepository = AuthRepository();
  //   emit(SignupwithgoogleLoading());
  //   User? user = await authRepository.signInWithGoogle();
  //   bool newUser = await authRepository.authenticateUser(user!);
  //   if (newUser) {}
  //   emit(SignupDone());
  // }

  void signInWithEmailPassword(
    String? email,
    String? password,
    String? dob,
    int? age,
    String name,
  ) async {
    emit(Loading());
    User? user =
        await authRepository.signInWithEmailPassword(email!, password!);
    if (user == null) {
      emit(CreatingAccountState());
      User? user =
          await authRepository.signUpWithEmailPassword(email, password, name);
      authRepository.addDataToDb(user!, dob!, age!, true, name);
      Future.delayed(const Duration(seconds: 2), () {
        emit(SignupDone());
      });
    } else {
      emit(SignupDone());
    }
  }

  void signOut() async {
    emit(Loading());
    await authRepository.signOut();
    emit(SignOutDone());
  }
}
