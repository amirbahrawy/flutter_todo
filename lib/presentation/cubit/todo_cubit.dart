import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/server_exceptions.dart';
import '../../data/repos/todo_repo.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodosRepository repository;

  TodoCubit(this.repository) : super(TodoState());

  void getTodos() async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      final todos = await repository.getTodos();
      emit(state.copyWith(
        todos: todos,
        status: TodoStatus.loaded,
      ));
    } on ServerException catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.message,
      ));
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
