import 'package:signup/Data/Methods/DBMethods.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';

class DBRepository {
  DBMethods? _dbMethods = DBMethods();
  Future<List<ItemX>> fetchItemList() => _dbMethods!.fetchItemList();

  Future<void> addFavouriteItem(ItemX itemX) =>
      _dbMethods!.addFavouriteItem(itemX);

  Future<bool> isFavouriteItem(ItemX itemX) =>
      _dbMethods!.isFavouriteItem(itemX);

  Future<List<ItemX>> fetchFavouriteItems() => _dbMethods!.fetchFavouriteItems();
}
