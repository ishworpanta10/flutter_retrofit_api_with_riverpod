// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['id'] as int?,
      postId: json['post_id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
