import 'package:simple_auth/simple_auth.dart' as simpleAuth;

import 'package:app/constants/strings.dart';

final simpleAuth.GoogleApi googleApi = new simpleAuth.GoogleApi("google",
    Strings.GOOGLE_CLIENT_ID,
    Strings.AUTH_REDIRECT_URL,
    clientSecret: Strings.GOOGLE_CLIENT_SECRET,
    scopes: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile"
    ]);
