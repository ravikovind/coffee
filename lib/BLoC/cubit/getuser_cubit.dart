import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Models/UserX_Model.dart';
import 'package:signup/Data/Repository/AuthRepository.dart';

part 'getuser_state.dart';

class GetuserCubit extends Cubit<GetuserState> {
  GetuserCubit() : super(GetuserInitial()) {
    getUser();
  }
  void getUser() async {
    emit(GetUserLoading());
    final AuthRepository authRepository = AuthRepository();
    UserX? userX = await authRepository.getUserDetails();
    emit(GetUserDone(userX: userX));
  }
}
