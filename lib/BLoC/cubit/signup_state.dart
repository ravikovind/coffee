part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class Loading extends SignupState {}

class SignupDone extends SignupState {}

class SignOutLoading extends SignupState {}

class CreatingAccountState extends SignupState {}

class SignOutDone extends SignupState {}

class ErrorState extends SignupState {}

