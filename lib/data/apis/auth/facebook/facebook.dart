import 'package:simple_auth/simple_auth.dart' as simpleAuth;

import 'package:app/constants/strings.dart';

final simpleAuth.FacebookApi facebookApi = new simpleAuth.FacebookApi(
  "facebook",
  Strings.FACEBOOK_CLIENT_ID,
  Strings.FACEBOOK_CLIENT_SECRET,
  Strings.AUTH_REDIRECT_URL,
);
