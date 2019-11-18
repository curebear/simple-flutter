import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes.dart';
import 'data/apis/rest/api_service.dart';
import 'data/sharedpref/shared_preference_helper.dart';
import 'ui/screens/splash/splash.dart';
import 'constants/app_theme.dart';
import 'constants/strings.dart';

void registerIoCProviders() {
  // Services
  GetIt.I.registerSingleton<ApiService>(ApiService.build(ConnectionOptions(Strings.baseUrl)));  
}

void registerPreference() async {
  // SharedPreferences
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper(prefs));
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogging();  
  registerIoCProviders();
  registerPreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}
