import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/data/sharedpref/preferences.dart';
import 'package:app/routes.dart';
import 'package:app/serializers/post/post_item.dart';
import 'package:app/stores/post/post_store.dart';
import 'package:app/ui/widgets/list_spinner.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  //store
  final _store = PostItemStore();

  @override
  void initState() {
    super.initState();

    //get all posts
    if (_store.start == 0) {
      _store.getPosts(_store.start);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Posts'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setBool(Preferences.is_logged_in, false);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            });
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return Material(child: _buildListView());
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _store.success
                ? Container()
                : showErrorMessage(context, _store.errorStore.errorMessage);
          },
        )
      ],
    );
  }

  Widget _buildListView() {
    return _store.posts.length != 0
      ? NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Observer(
            builder: (_) {
              return ListView.separated(
                itemCount: _store.posts.length + 1,
                controller: _scrollController,
                separatorBuilder: (context, position) {
                  return Divider();
                },
                itemBuilder: (context, position) {
                  if (position < _store.posts.length) {
                    return _buildRow(_store.posts[position]);
                  } else {
                    return Observer(
                        builder: (_) => ListSpinner(loading: _store.loading));
                  }
                },
              );
            },
          ),
        )
      : Center(child: Text('No posts found'));
  }

  Widget _buildRow(PostItem post) {
    return ListTile(
      leading: Icon(Icons.cloud_circle),
      title: Text(
        '${post.id} - ${post.title}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        '${post.body}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (_scrollController.position.extentAfter == 0 ) {
        _store.getPosts(_store.start + _store.defaultLimit);
      }
    }
    return false;
  }


  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {
        FlushbarHelper.createError(
          message: message,
          title: 'Error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return Container();
  }
}