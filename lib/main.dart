import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_login/flutter_login.dart';
import 'package:login/ui/login_page.dart';
import 'router.dart' as router;

void main() => runApp(new MyApp());
//void main() => runApp(MyTestApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle().copyWith(statusBarColor: Colors.black));
    return MaterialApp(
      title: 'Ay yo wth',
      theme: ThemeData(
        backgroundColor: Colors.amber,
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/login',
    );
  }
}

