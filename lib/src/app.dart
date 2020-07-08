import 'package:flutter/material.dart';

import 'home_screen.dart';

class UnSplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnSplash',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      initialRoute: '/',
      routes: {'/': (context) => HomeScreen()},
      debugShowCheckedModeBanner: false,
    );
  }
}
