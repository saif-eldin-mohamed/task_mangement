class TaskModel {
  final String? id;
  final String title;
  final String date;
  final bool isDone;

  const TaskModel({
     this.id,
    required this.title,
    required this.date,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json,) {
    return TaskModel(
      id: json['id']??'' ,
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      isDone: json['isDone'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'isDone': isDone,
    };
  }
  TaskModel copyWith({
    String? id,
    String? title,
    String? date,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id, 
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }
}
