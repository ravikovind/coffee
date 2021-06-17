import 'package:signup/Data/Methods/DBMethods.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';

class DBRepository {
  DBMethods? _dbMethods = DBMethods();
  Future<List<ItemX?>> fetchItemList() => _dbMethods!.fetchItemList();
}
