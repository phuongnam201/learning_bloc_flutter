import 'package:equatable/equatable.dart';
import 'package:learning_bloc/model/post_model.dart';
import 'package:learning_bloc/utils/enum.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postStatus, postList];
}
