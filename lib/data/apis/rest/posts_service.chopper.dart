// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PostsService extends PostsService {
  _$PostsService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PostsService;

  Future<Response<List<PostItem>>> getPosts(int start, int limit) {
    final $url = '/posts/';
    final Map<String, dynamic> $params = {'_start': start, '_limit': limit};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<PostItem>, PostItem>($request);
  }

  Future<Response<PostItem>> getPost(String id) {
    final $url = '/posts/$id/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PostItem, PostItem>($request);
  }
}
