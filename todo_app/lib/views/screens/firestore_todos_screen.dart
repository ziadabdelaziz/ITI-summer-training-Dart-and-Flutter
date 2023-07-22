import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference todos = FirebaseFirestore.instance.collection('todos');

    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Object?>>(
        future: todos.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && snapshot.data == null) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.docs;
            print(data);
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(data[index]['title']),
                      ),
                      leading: data[index]['completed']
                          ? const Icon(
                              Icons.task_alt_rounded,
                              color: Colors.green,
                            )
                          : const Icon(Icons.circle_outlined),
                      // trailing: Text(
                      //     context.watch<TodosCubit>().todos[index].id.toString()),
                      // key:
                      //     ValueKey(data['id']),
                    ),
                  );
                });
          }

          return const Text("loading");
        },
      ),
    );
  }
}
