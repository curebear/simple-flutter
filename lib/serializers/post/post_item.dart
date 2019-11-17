import 'package:json_annotation/json_annotation.dart';

part 'post_item.g.dart';

@JsonSerializable()
class PostItem {
  int userId;
  int id;
  String title;
  String body;

  PostItem(this.userId,
    this.id,
    this.title,
    this.body,
  );

  static const fromJson= _$PostItemFromJson;
  Map<String, dynamic> toJson() => _$PostItemToJson(this);
}