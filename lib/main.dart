import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/routes/routeGenerator.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppColors lightColor = AppColors();
AppNightModeColors darkColor = AppNightModeColors();
bool darkMode = false;
bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final shareStorage = await SharedPreferences.getInstance();
  final isLoggedIn = shareStorage.getBool('isLoggedIn') ?? false;
  darkMode = shareStorage.getBool("darkmode") ?? false;
  runApp(ChangeNotifierProvider(
    create: (_) => AllChangeNotifier(),
    child: MyApp(isLoggedIn: isLoggedIn),
  ));
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
        home: const HomePage(),
        initialRoute: isLoggedIn ? '/' : '/login',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
