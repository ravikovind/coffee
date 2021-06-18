import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:signup/Data/Repository/DBRepository.dart';

part 'shopitem_state.dart';

class ShopitemCubit extends Cubit<ShopitemState> {
  ShopitemCubit() : super(ShopitemInitial()) {
    fetchItemList();
  }
  void fetchItemList() async {
    emit(ShopitemLoading());
    List<ItemX?> items = [];
    final DBRepository repository = DBRepository();
    items = await repository.fetchItemList();
    emit(ShopitemDone(itemX: items));
  }
}
