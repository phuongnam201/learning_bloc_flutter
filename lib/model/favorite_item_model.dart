import 'package:equatable/equatable.dart';

class FavoriteItemModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleteing;
  final bool isFavorite;

  FavoriteItemModel({
    required this.id,
    required this.value,
    this.isDeleteing = false,
    this.isFavorite = false,
  });

  FavoriteItemModel copyWith(
      {String? id, String? value, bool? isDeleteing, bool? isFavorite}) {
    return FavoriteItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleteing: isDeleteing ?? this.isDeleteing,
      isFavorite: isDeleteing ?? this.isFavorite,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isDeleteing, isFavorite];
}
