

abstract class ITodo{
  final int id;
  final String title;
  final bool completed;

  ITodo({
    required this.id,
    required this.title,
    required this.completed,
  });

  copyWith({
    int? id,
    String? title,
    bool? completed,
  });
}