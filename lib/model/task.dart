class Task {
  int id = 0;
  int userId = 0;
  String content = '';
  bool completed = false;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  Task(this.id, this.content, this.completed);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['title'],
        completed = json['completed'],
        userId = json['userId'];

  //prepare json data from Dart object to send to API
  Map<String, dynamic> toJson() => {
      'id': id,
      'userId': userId,
      'completed': completed,
      'title': content,
  };

}
