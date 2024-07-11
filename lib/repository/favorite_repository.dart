import 'package:learning_bloc/model/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavoriteItemModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavoriteItemModel(id: index.toString(), value: 'item $index'));
  }
}
