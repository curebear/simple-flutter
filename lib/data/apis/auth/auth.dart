import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:logging/logging.dart';

export 'google/google.dart';
export 'facebook/facebook.dart';

final simpleAuth.BasicAuthApi githubBasicApi = new simpleAuth.BasicAuthApi(
    "github-basic", "https://api.github.com/user");

void login(simpleAuth.AuthenticatedApi api) async {
  final log = Logger('Auth');

  try {
    var success = await api.authenticate();
    log.info('Logged: ${success}');
  } catch (e) {
    log.warning('Not Logged: ${e}');
  }
}
