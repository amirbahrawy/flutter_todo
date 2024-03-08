import 'package:flutter/material.dart';

import '../../data/models/todo.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails(this.todo, {super.key});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
        centerTitle: true,
      ),
      // show user id and id and title and completed as checkboxes
      body: Column(
        children: <Widget>[
          ListTile(title: Text('User ID: ${todo.userId}')),
          ListTile(title: Text('ID: ${todo.id}')),
          ListTile(title: Text('Title: ${todo.title}')),
          ListTile(
            title: const Text('Completed'),
            trailing: Checkbox(
              value: todo.completed,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
