part of 'shopitem_cubit.dart';

@immutable
abstract class ShopitemState {}

class ShopitemInitial extends ShopitemState {}

class ShopitemLoading extends ShopitemState {}

class ShopitemDone extends ShopitemState {
  late final List<ItemX?> itemX;
  ShopitemDone({
    required this.itemX,
  });
}
