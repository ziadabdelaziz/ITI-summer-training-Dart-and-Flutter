import 'package:flutter/material.dart';
import '../todos/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosCubit>(
      create: (context) => TodosCubit(),
      child: BlocConsumer<TodosCubit, TodosState>(
        listener: (context, state) {
          if (state is TodosError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Oops!, YOU ENCOUNTERED AN ERROR"),
            ));
          }
        },
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodosSuccess) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: context.watch<TodosCubit>().todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            context.watch<TodosCubit>().todos[index].title),
                      ),
                      leading:
                          context.watch<TodosCubit>().todos[index].completed
                              ? const Icon(
                                  Icons.task_alt_rounded,
                                  color: Colors.green,
                                )
                              : const Icon(Icons.circle_outlined),
                      // trailing: Text(
                      //     context.watch<TodosCubit>().todos[index].id.toString()),
                      key:
                          ValueKey(context.watch<TodosCubit>().todos[index].id),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text("Error in this screen"),
            );
          }
        },
      ),
    );
  }
}
