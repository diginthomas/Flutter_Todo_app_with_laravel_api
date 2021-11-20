class Todo {
  int id;
  String title;
  String message;
  Todo({required this.id, required this.title, required this.message});
  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'message': message};
}
