part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupwithgoogleLoading extends SignupState {}

class SignupwithEmailPasswordLoading extends SignupState {}

class SignupDone extends SignupState {}

class SignOutLoading extends SignupState {}

class SignOutDone extends SignupState {}
