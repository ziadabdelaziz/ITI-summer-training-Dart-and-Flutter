import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/todo_model.dart';

import '../../services/todo_service.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()) {
    getTodos();
  }
  List<TodoModel> todos = [];
  bool isLoading = true;

  void getTodos() async {
    emit(TodosLoading());
    try {
      todos = await TodoService().getTodosData();
      isLoading = false;
      emit(TodosSuccess());
    } catch (e) {
      emit(TodosError());
      print(e.toString());
    }
  }
}
