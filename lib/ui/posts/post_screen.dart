import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/posts/posts_bloc.dart';
import 'package:learning_bloc/bloc/posts/posts_event.dart';
import 'package:learning_bloc/bloc/posts/posts_state.dart';
import 'package:learning_bloc/utils/enum.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post API"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.failure:
              return const Center(
                child: Text("something went wrong"),
              );
            case PostStatus.success:
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ListView.builder(
                      itemCount: state.postList.length,
                      itemBuilder: (context, index) {
                        final item = state.postList[index];
                        return Card(
                          child: ListTile(
                            title: Text(item.email.toString()),
                          ),
                        );
                      }),
                ),
              );
          }
        },
      ),
    );
  }
}
