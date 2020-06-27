import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'EmagreceBughi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Colors.white,
        accentColor: Colors.white,
        dividerColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        canvasColor: Colors.deepPurpleAccent,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
