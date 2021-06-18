part of 'favouriteitem_cubit.dart';

@immutable
abstract class FavouriteitemState {}

class FavouriteitemInitial extends FavouriteitemState {}

class FavouriteitemLoading extends FavouriteitemState {}

class FavouriteitemDone extends FavouriteitemState {}

class AlreadyFavouriteItem extends FavouriteitemState {}


