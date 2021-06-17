import 'package:bloc/bloc.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  late List<ItemX> items = [];
  ItemCubit() : super(ItemState(itemX: []));

  void addItemX(ItemX itemX) {
    items.add(itemX);
    emit(ItemState(itemX: items));
  }

  void removeItemX(ItemX itemX) {
    items.remove(itemX);
    emit(ItemState(itemX: items));
  }
}
