import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/favorite/favorite_app_event.dart';
import 'package:learning_bloc/bloc/favorite/favorite_app_state.dart';
import 'package:learning_bloc/model/favorite_item_model.dart';
import 'package:learning_bloc/repository/favorite_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteItemState> {
  List<FavoriteItemModel> favoriteItemList = [];
  List<FavoriteItemModel> temFavoriteItemList = [];

  FavoriteRepository favoriteRepository;

  FavoriteBloc(this.favoriteRepository) : super(const FavoriteItemState()) {
    on<FetchFavoriteList>(_fetchList);
    on<FavoriteItem>(_addFavoriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchList(
      FetchFavoriteList event, Emitter<FavoriteItemState> emit) async {
    favoriteItemList = await favoriteRepository.fetchItem();
    emit(state.copyWith(
        favoriteItemList: List.from(favoriteItemList),
        listStatus: ListStatus.success));
  }

  void _addFavoriteItem(
      FavoriteItem event, Emitter<FavoriteItemState> emit) async {
    final index =
        favoriteItemList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavorite) {
      if (temFavoriteItemList.contains(favoriteItemList[index])) {
        temFavoriteItemList.remove(favoriteItemList[index]);
        temFavoriteItemList.add(event.item);
      }
    } else {
      if (temFavoriteItemList.contains(favoriteItemList[index])) {
        temFavoriteItemList.remove(favoriteItemList[index]);
        temFavoriteItemList.add(event.item);
      }
    }
    favoriteItemList[index] = event.item;
    emit(state.copyWith(
        favoriteItemList: List.from(favoriteItemList),
        temFavoriteItemList: List.from(temFavoriteItemList)));
  }

  void _selectItem(SelectItem event, Emitter<FavoriteItemState> emit) async {
    temFavoriteItemList.add(event.item);
    emit(state.copyWith(temFavoriteItemList: List.from(temFavoriteItemList)));
  }

  void _unSelectItem(
      UnSelectItem event, Emitter<FavoriteItemState> emit) async {
    temFavoriteItemList.remove(event.item);
    emit(state.copyWith(temFavoriteItemList: List.from(temFavoriteItemList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavoriteItemState> emit) async {
    for (int i = 0; i < temFavoriteItemList.length; i++) {
      favoriteItemList.remove(temFavoriteItemList[i]);
    }
    temFavoriteItemList.clear();
    emit(state.copyWith(
        favoriteItemList: List.from(favoriteItemList),
        temFavoriteItemList: List.from(temFavoriteItemList)));
  }
}
