import 'package:equatable/equatable.dart';
import 'package:learning_bloc/model/favorite_item_model.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoriteList extends FavoriteEvent {}

class FavoriteItem extends FavoriteEvent {
  final FavoriteItemModel item;
  const FavoriteItem({required this.item});
}

class SelectItem extends FavoriteEvent {
  final FavoriteItemModel item;
  const SelectItem({required this.item});
}

class UnSelectItem extends FavoriteEvent {
  final FavoriteItemModel item;
  const UnSelectItem({required this.item});
}

class DeleteItem extends FavoriteEvent {}
