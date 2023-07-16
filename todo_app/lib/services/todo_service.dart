import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class TodoService {
  String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> getTodosData() async {
    List<TodoModel> todos = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      TodoModel todo = TodoModel.fromJson(jsonElement);
      todos.add(todo);
    });
    return todos;
  }
}
