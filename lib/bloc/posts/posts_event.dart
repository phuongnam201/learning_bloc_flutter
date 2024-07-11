import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetch extends PostsEvent {}
