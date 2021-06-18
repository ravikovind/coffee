import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:signup/Data/Repository/DBRepository.dart';

part 'fetch_favourite_items_state.dart';

class FetchFavouriteItemsCubit extends Cubit<FetchFavouriteItemsState> {
  FetchFavouriteItemsCubit() : super(FetchFavouriteItemsInitial());
  late final DBRepository repository = DBRepository();
  void fetchFavouriteItems() async {
    emit(FetchFavouriteItemsLoading());
    List<ItemX?> items = [];
    items = await repository.fetchFavouriteItems();
    emit(FetchFavouriteItemsDone(itemX: items));
  }
}
