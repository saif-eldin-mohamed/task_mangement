class TaskModel {
  final String id;
  final String title;
  final String date;
  final bool isDone;

  const TaskModel({
    required this.id,
    required this.title,
    required this.date,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    return TaskModel(
      id: id,
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      isDone: json['isDone'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'isDone': isDone,
    };
  }
}
