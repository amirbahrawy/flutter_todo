import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/core/di.dart';

import '../../data/models/todo.dart';
import '../cubit/todo_cubit.dart';
import '../cubit/todo_state.dart';
import 'todo_details.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      body: BlocProvider(
          create: (context) => Injector().todoCubit..getTodos(),
          child: BlocConsumer<TodoCubit, TodoState>(listener: (context, state) {
            if (state.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
            }
          }, builder: (context, state) {
            if (state.isLoading || state.isInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            final todos = state.todos;
            if (todos?.isEmpty == true) {
              return const Center(child: Text('No todos found!'));
            }
            return _buildTodosList(todos!);
          })),
    );
  }

  ListView _buildTodosList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TodoDetails(todo);
            }));
          },
          child: ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.completed,
              onChanged: (value) {},
            ),
          ),
        );
      },
    );
  }
}
