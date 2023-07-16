import 'package:flutter/material.dart';
import '../../services/todo_service.dart';
import '../../models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];
  bool isLoading = true;

  void getTodos() async {
    todos = await TodoService().getTodosData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(todos[index].title),
                    trailing: todos[index].completed
                        ? const Icon(
                            Icons.task_alt_rounded,
                            color: Colors.green,
                          )
                        : const Icon(Icons.circle_outlined),
                    key: ValueKey(todos[index].id),
                  );
                }),
          );
  }
}
