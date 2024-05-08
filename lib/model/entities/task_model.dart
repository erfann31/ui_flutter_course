import 'dart:convert';

class Task {
  final int? id;
  final String title;
  final String description;
  final bool? completed;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.completed,
  });

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
