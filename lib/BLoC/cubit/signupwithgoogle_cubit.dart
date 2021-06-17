import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signupwithgoogle_state.dart';

class SignupwithgoogleCubit extends Cubit<SignupwithgoogleState> {
  SignupwithgoogleCubit() : super(SignupwithgoogleInitial());

  void signInWithGoogle(String? dob, int? age, String? name) async {
    final AuthRepository authRepository = AuthRepository();
    emit(SignupwithgoogleLoading());
    User? user = await authRepository.signInWithGoogle();
    bool newUser = await authRepository.authenticateUser(user!);
    if (!newUser) {
      authRepository.addDataToDb(user, dob!, age!, false, name!);
    }
    emit(SignupwithgoogleDone());
  }

 void signOut() async {
    emit(SignupwithgoogleLoading());
    final AuthRepository authRepository = AuthRepository();
    await authRepository.signOut();
    emit(SignOutDone());
  }

   void getCurrentUser() async {
    emit(SignOutLoading());
    final AuthRepository authRepository = AuthRepository();
    await authRepository.getCurrentUser();
    emit(SignOutDone());
  }

 void signUp(
    String? email,
    String? password,
    String? dob,
    int? age,
    String name,
  ) async {
    final AuthRepository authRepository = AuthRepository();
    emit(SignupwithgoogleLoading());
    User? user = await authRepository.signUp(email!, password!, name);
    if (user != null) {
      if (!user.emailVerified) {
        bool newUser = await authRepository.authenticateUser(user);
        if (!newUser) {
          authRepository.addDataToDb(user, dob!, age!, true, name);
        }
      }
    }
    emit(SignupwithgoogleDone());
  }
}
