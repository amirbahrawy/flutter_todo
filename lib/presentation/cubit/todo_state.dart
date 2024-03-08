// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../data/models/todo.dart';

enum TodoStatus { initial, loading, loaded, error }

extension TodoStatusX on TodoState {
  bool get isInitial => status == TodoStatus.initial;
  bool get isLoading => status == TodoStatus.loading;
  bool get isLoaded => status == TodoStatus.loaded;
  bool get isError => status == TodoStatus.error;
}

class TodoState {
  final List<Todo>? todos;
  final TodoStatus? status;
  final String? errorMessage;
  TodoState({
    this.todos,
    this.status = TodoStatus.initial,
    this.errorMessage,
  });

  TodoState copyWith({
    List<Todo>? todos,
    TodoStatus? status,
    String? errorMessage,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(covariant TodoState other) {
    if (identical(this, other)) return true;

    return listEquals(other.todos, todos) &&
        other.status == status &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => todos.hashCode ^ status.hashCode ^ errorMessage.hashCode;
}
