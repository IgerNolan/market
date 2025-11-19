import 'package:flutter/material.dart';

import 'package:market/page/main/index.dart';
import 'package:market/page/login/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    initialRoute: "/",
    routes: getRootRoute(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoute() {
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage()
  };
}
