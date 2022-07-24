import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  const PostModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as int?,
      userId: map['userId'] as int?,
      title: map['title'] as String?,
      body: map['body'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, userId, title, body];
}
