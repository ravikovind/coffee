part of 'getuser_cubit.dart';

@immutable
abstract class GetuserState {}

class GetuserInitial extends GetuserState {}

class GetUserLoading extends GetuserState {}

class GetUserDone extends GetuserState {
  late final UserX? userX;
  GetUserDone({
    required this.userX,
  });
}
