// To parse this JSON data, do
//
//     final TodoModel = TodoModelFromJson(jsonString);

import 'dart:convert';

List<TodoModel> TodoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String TodoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
    final int userId;
    final String id;
    final String title;
    final bool completed;

    TodoModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    TodoModel copyWith({
        int? userId,
        String? id,
        String? title,
        bool? completed,
    }) => 
        TodoModel(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            completed: completed ?? this.completed,
        );

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
