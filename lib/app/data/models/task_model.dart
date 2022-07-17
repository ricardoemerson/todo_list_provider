import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {
  final int id;
  final String description;
  final DateTime dateTime;
  final bool done;

  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'date_time': dateTime.millisecondsSinceEpoch,
      'done': done,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      dateTime: DateTime.parse(map['date_time']),
      done: map['done'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));
}
