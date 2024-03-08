import 'package:flutter_todo/data/datasources/todo_remote_datasource.dart';

import '../data/repos/todo_repo.dart';
import '../presentation/cubit/todo_cubit.dart';
import 'services/network_service.dart';

class Injector {
  final _flyweightMap = <String, dynamic>{};
  static final _singleton = Injector._internal();

  Injector._internal();
  factory Injector() => _singleton;

  //===================[Todos Cubit]===================
  TodoCubit get todoCubit => TodoCubit(todosRepository);
  TodosRepository get todosRepository => _flyweightMap["TodosRepository"] ??=
      TodosRepositoryImpl(todosRemoteDataSource);
  TodosRemoteDataSource get todosRemoteDataSource =>
      _flyweightMap["TodosRemoteDataSource"] ??=
          TodosRemoteDataSourceImpl(client: networkService);
  //===================[Network Service]===================
  NetworkService get networkService =>
      _flyweightMap["NetworkService"] ??= NetworkServiceImpl();
}
