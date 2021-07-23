import 'package:flutter/material.dart';
import 'ui/sendDates_page.dart';
import 'ui/login_page.dart';
import 'ui/profile_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/profile':
      return MaterialPageRoute(builder: (context) => ProfilePage(username: args,));
    case '/holiday':
      return MaterialPageRoute(builder: (context) => DatePage(usernameId: args));
  }
}
