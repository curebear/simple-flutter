import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'package:app/data/apis/rest/api.dart';
import 'package:app/serializers/post/post_item.dart';
import 'package:app/stores/error/error_store.dart';

part 'post_store.g.dart';

class PostItemStore = _PostItemStore with _$PostItemStore;

abstract class _PostItemStore with Store {
  final log = Logger('PostStore');

  final int defaultLimit = 9;

  // service
  PostsService service = GetIt.I<ApiService>().posts;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  ObservableList<PostItem> posts = ObservableList.of([]);

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  int start = 0;


  // actions:-------------------------------------------------------------------
  @action
  Future getPosts(int start) async {
    loading = true;
    service.getPosts(start, defaultLimit).then((response) {
      log.info("response: ${response.body}");
      if (response.body.length != 0) {
        this.posts.addAll(response.body);
        this.start = start;
      }
      loading = false;
      success = true;
    }).catchError((e) {
      errorStore.errorMessage = e.toString();
      log.severe("e: $e");
      loading = false;
      success = false;
    });
  }
}