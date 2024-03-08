import '../datasources/todo_remote_datasource.dart';
import '../models/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> getTodos();
}

class TodosRepositoryImpl implements TodosRepository {
  final TodosRemoteDataSource todoRemoteDataSource;

  TodosRepositoryImpl(this.todoRemoteDataSource);

  @override
  Future<List<Todo>> getTodos() async => todoRemoteDataSource.getTodos();
}
