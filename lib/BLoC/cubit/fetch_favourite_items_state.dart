part of 'fetch_favourite_items_cubit.dart';

@immutable
abstract class FetchFavouriteItemsState {}

class FetchFavouriteItemsInitial extends FetchFavouriteItemsState {}

class FetchFavouriteItemsLoading extends FetchFavouriteItemsState {}

class FetchFavouriteItemsDone extends FetchFavouriteItemsState {
  late final List<ItemX?> itemX;
  FetchFavouriteItemsDone({
    required this.itemX,
  });
}
