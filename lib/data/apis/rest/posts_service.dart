import 'dart:async';
import 'package:chopper/chopper.dart';

import 'package:app/serializers/post/post_item.dart';

part 'posts_service.chopper.dart';

@ChopperApi(baseUrl: "/posts")
abstract class PostsService extends ChopperService {
  static PostsService create([ChopperClient client]) => _$PostsService(client);

  @Get(path: "/")
  Future<Response<List<PostItem>>> getPosts(@Query('_start') int start, @Query('_limit') int limit);

  @Get(path: "/{id}/")
  Future<Response<PostItem>> getPost(@Path() String id);
}