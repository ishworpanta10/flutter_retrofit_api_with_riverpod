import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CommentModel({
    int? id,
    int? postId,
    String? name,
    String? email,
    String? body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
  // Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
