import '../../core/exceptions/server_exceptions.dart';
import '../../core/services/network_service.dart';
import '../models/todo.dart';
import 'package:dio/dio.dart';

abstract class TodosRemoteDataSource {
  Future<List<Todo>> getTodos();
}

class TodosRemoteDataSourceImpl implements TodosRemoteDataSource {
  final NetworkService client;

  TodosRemoteDataSourceImpl({required this.client});
  @override
  Future<List<Todo>> getTodos() async {
    try {
      final response = await client.get("todos");
      if (response.statusCode == 200) {
        final List<Todo> todos = (response.data["todos"] as List)
            .map((e) => Todo.fromMap(e as Map<String, dynamic>))
            .toList();
        return todos;
      } else
        throw ServerException();
    } on DioException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (_) {
      throw ServerException();
    }
  }
}
