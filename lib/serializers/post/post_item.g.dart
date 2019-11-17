// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostItem _$PostItemFromJson(Map<String, dynamic> json) {
  return PostItem(
    json['userId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['body'] as String,
  );
}

Map<String, dynamic> _$PostItemToJson(PostItem instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
