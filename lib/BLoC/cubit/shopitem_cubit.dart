import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:signup/Data/Repository/DBRepository.dart';

part 'shopitem_state.dart';

class ShopitemCubit extends Cubit<ShopitemState> {
  ShopitemCubit() : super(ShopitemInitial());
  void fetchItemList() async {
    emit(ShopitemLoading());
    List<ItemX?> items = [];
    final DBRepository repository = DBRepository();
    await repository.fetchItemList().then((value) {
      items = value;
    });
    emit(ShopitemDone(itemX: items));
  }
}
