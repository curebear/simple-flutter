// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostItemStore on _PostItemStore, Store {
  final _$postsAtom = Atom(name: '_PostItemStore.posts');

  @override
  ObservableList<PostItem> get posts {
    _$postsAtom.context.enforceReadPolicy(_$postsAtom);
    _$postsAtom.reportObserved();
    return super.posts;
  }

  @override
  set posts(ObservableList<PostItem> value) {
    _$postsAtom.context.conditionallyRunInAction(() {
      super.posts = value;
      _$postsAtom.reportChanged();
    }, _$postsAtom, name: '${_$postsAtom.name}_set');
  }

  final _$successAtom = Atom(name: '_PostItemStore.success');

  @override
  bool get success {
    _$successAtom.context.enforceReadPolicy(_$successAtom);
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.conditionallyRunInAction(() {
      super.success = value;
      _$successAtom.reportChanged();
    }, _$successAtom, name: '${_$successAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_PostItemStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$startAtom = Atom(name: '_PostItemStore.start');

  @override
  int get start {
    _$startAtom.context.enforceReadPolicy(_$startAtom);
    _$startAtom.reportObserved();
    return super.start;
  }

  @override
  set start(int value) {
    _$startAtom.context.conditionallyRunInAction(() {
      super.start = value;
      _$startAtom.reportChanged();
    }, _$startAtom, name: '${_$startAtom.name}_set');
  }

  final _$getPostsAsyncAction = AsyncAction('getPosts');

  @override
  Future getPosts(int start) {
    return _$getPostsAsyncAction.run(() => super.getPosts(start));
  }
}
