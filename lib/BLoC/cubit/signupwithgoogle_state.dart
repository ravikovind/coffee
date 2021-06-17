part of 'signupwithgoogle_cubit.dart';

@immutable
abstract class SignupwithgoogleState {}

class SignupwithgoogleInitial extends SignupwithgoogleState {}

class SignupwithgoogleLoading extends SignupwithgoogleState {}

class SignupwithgoogleDone extends SignupwithgoogleState {}

class GetCurrentUserDone extends SignupwithgoogleState {
  late final User? user;
  GetCurrentUserDone({
    required this.user,
  });
}

class SignOutLoading extends SignupwithgoogleState {}

class SignOutDone extends SignupwithgoogleState {}

class SignupwithgoogleError extends SignupwithgoogleState {}
