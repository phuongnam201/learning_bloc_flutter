import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/todo/bloc/todo_bloc.dart';
import 'package:learning_bloc/bloc/todo/bloc/todo_event.dart';
import 'package:learning_bloc/bloc/todo/bloc/todo_state.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(
              child: Text("No todo found"),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Task " + index.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context
                          .read<ToDoBloc>()
                          .add(RemoveTodoEvent(task: state.todosList[index]));
                    },
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add_btn",
        onPressed: () {
          for (int i = 0; i < 10; i++)
            context
                .read<ToDoBloc>()
                .add(AddTodoEvent(task: 'task ' + i.toString()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
