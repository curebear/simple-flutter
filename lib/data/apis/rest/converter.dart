import 'package:chopper/chopper.dart' hide Post;
import 'package:logging/logging.dart';

import 'package:app/serializers/post/post_item.dart';

typedef T JsonFactory<T>(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final log = Logger('JsonSerializableConverter');
  final Map<String, JsonFactory> factories;

  JsonSerializableConverter(this.factories);

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T.toString()];
    log.info("jsonFactory: $jsonFactory");

    if (jsonFactory == null) {
      log.warning("jsonFactory is null");
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values) {
    return values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();
  }

  dynamic _decode<T>(entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is Map) {
      return _decodeMap<T>(entity);
    }
    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final jsonRes = super.convertResponse(response);
    return jsonRes.replace<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  Request convertRequest(Request request) => super.convertRequest(request);
}

final jsonConverter = JsonSerializableConverter(
  {
    "PostItem": PostItem.fromJson,
  }
 );