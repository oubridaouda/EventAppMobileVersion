import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileView.dart';
import 'package:event_mobile_app/screen/auth/resetPassword.dart';
import 'package:event_mobile_app/screen/auth/signUp.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/sign-up':
        return MaterialPageRoute(builder: (context) => const SignUp());
      case '/reset-password':
        return MaterialPageRoute(builder: (context) => const ResetPassword());
      // case '/profile':
      //   return MaterialPageRoute(builder: (context) => const ProfileView());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text("404 error"), centerTitle: true),
            body: const Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}
