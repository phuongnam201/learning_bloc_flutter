import 'package:bloc/bloc.dart';
import 'package:learning_bloc/bloc/posts/posts_event.dart';
import 'package:learning_bloc/bloc/posts/posts_state.dart';
import 'package:learning_bloc/repository/post_repository.dart';
import 'package:learning_bloc/utils/enum.dart';

class PostsBloc extends Bloc<PostsEvent, PostState> {
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(const PostState()) {
    on<PostFetch>(_fetchList);
  }

  void _fetchList(PostFetch event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'success',
        postList: value,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
