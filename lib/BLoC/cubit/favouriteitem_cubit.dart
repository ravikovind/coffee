import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:signup/Data/Repository/DBRepository.dart';

part 'favouriteitem_state.dart';

class FavouriteitemCubit extends Cubit<FavouriteitemState> {
  FavouriteitemCubit() : super(FavouriteitemInitial());

  final DBRepository _dbRepository = DBRepository();

  Future<void> addFavouriteItem(ItemX itemX) async {
    emit(FavouriteitemLoading());
    await _dbRepository.addFavouriteItem(itemX);
    emit(FavouriteitemDone());
  }
  // Future<bool> isFavouriteItem(ItemX itemX) async {
  //   emit(FavouriteitemLoading());
  //   bool isFavouriteItem = await _dbRepository.isFavouriteItem(itemX);
  //   emit(FavouriteitemDone());
  //   return isFavouriteItem;
  // }
}
