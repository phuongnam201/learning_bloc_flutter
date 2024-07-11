import 'package:equatable/equatable.dart';
import 'package:learning_bloc/model/favorite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavoriteItemState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final List<FavoriteItemModel> temFavoriteItemList;
  final ListStatus listStatus;

  const FavoriteItemState({
    this.favoriteItemList = const [],
    this.temFavoriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriteItemState copyWith(
      {List<FavoriteItemModel>? favoriteItemList,
      List<FavoriteItemModel>? temFavoriteItemList,
      ListStatus? listStatus}) {
    return FavoriteItemState(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      temFavoriteItemList: temFavoriteItemList ?? this.temFavoriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [favoriteItemList, temFavoriteItemList, listStatus];
}
