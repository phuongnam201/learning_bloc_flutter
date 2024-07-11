import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter/counter_bloc.dart';
import 'package:learning_bloc/bloc/favorite/bloc/favorite_app_bloc.dart';
import 'package:learning_bloc/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:learning_bloc/bloc/switch_example/bloc/switch_bloc.dart';
import 'package:learning_bloc/bloc/todo/bloc/todo_bloc.dart';
import 'package:learning_bloc/repository/favorite_repository.dart';
import 'package:learning_bloc/ui/favorite_app/favorite_app_screen.dart';
import 'package:learning_bloc/ui/todo/todo_screen.dart';
import 'package:learning_bloc/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(create: (context) => ToDoBloc()),
        BlocProvider(create: (context) => FavoriteBloc(FavoriteRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FavoriteAppScreen(),
      ),
    );
  }
}
