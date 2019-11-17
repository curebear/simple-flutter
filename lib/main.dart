import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'routes.dart';
import 'data/apis/rest/api_service.dart';
import 'ui/screens/splash/splash.dart';
import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'package:logging/logging.dart';

void registerIoCProviders() {
  // Services
  GetIt.I.registerSingleton<ApiService>(ApiService.build(ConnectionOptions(Strings.baseUrl)));
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() {
  setupLogging();  
  registerIoCProviders();
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
