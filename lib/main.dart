import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/routes/routeGenerator.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppColors appColor = AppColors();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logged = await SharedPreferences.getInstance();
  final isLoggedIn = logged.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  var isLogin = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        title: 'DuckEvent',
        home: HomePage(),
        initialRoute: '/login',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}

