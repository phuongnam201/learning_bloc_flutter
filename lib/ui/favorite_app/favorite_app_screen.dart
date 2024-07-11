import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/favorite/bloc/favorite_app_bloc.dart';
import 'package:learning_bloc/bloc/favorite/bloc/favorite_app_event.dart';
import 'package:learning_bloc/bloc/favorite/bloc/favorite_app_state.dart';
import 'package:learning_bloc/model/favorite_item_model.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriteBloc>().add(FetchFavoriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite App"),
        centerTitle: true,
        actions: [
          BlocBuilder<FavoriteBloc, FavoriteItemState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavoriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavoriteBloc>().add(DeleteItem());
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.deepOrange,
                    )),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavoriteBloc, FavoriteItemState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return const Text("Something went wrong");
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemList.length,
                  itemBuilder: ((context, index) {
                    final item = state.favoriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.temFavoriteItemList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavoriteBloc>()
                                  .add(SelectItem(item: item));
                            } else {
                              context
                                  .read<FavoriteBloc>()
                                  .add(UnSelectItem(item: item));
                            }
                          },
                        ),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavoriteItemModel favoriteItemModel =
                                FavoriteItemModel(
                              id: item.id,
                              value: item.value,
                              isFavorite: item.isFavorite ? false : true,
                            );

                            context
                                .read<FavoriteBloc>()
                                .add(FavoriteItem(item: favoriteItemModel));
                          },
                          icon: item.isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.deepOrange,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).disabledColor,
                                ),
                        ),
                      ),
                    );
                  }),
                );
            }
          },
        ),
      ),
    );
  }
}
