import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/menu/drawer.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            brightness: Brightness.dark, primarySwatch: Colors.orange),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              theme: theme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              title: 'DuckEvent',
              home: isLoggedIn ? HomePage() : LoginPage(),
            ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(scaffoldKey: _scaffoldKey),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [EventScreen()],
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();

  // you can replace 100 to whatever value you wish to use

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MyAppBarState extends State<MyAppBar> {
  final storage = FlutterSecureStorage();
  bool darkmode = false;
  dynamic saveThemeMode;

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    saveThemeMode = await AdaptiveTheme.getThemeMode();
    dynamic iconAddress;

    if (saveThemeMode.toString() == "AdaptiveThemeMode.dark") {
      print("thème claire");

      setState(() {
        appColor.dBackgroud = const Color(0xFFE8F7F7);
        appColor.btnColor = const Color(0xFFE8F7F7);
        appColor.dWhite = const Color(0xFFFFFFFF);

        AdaptiveTheme.of(context).setLight();
        darkmode = false;
        iconAddress = Icon(Icons.shield_moon_outlined);
      });
    } else {
      print("thème sombre");
      setState(() {
        appColor.dBackgroud = const Color(0xFF111315);
        appColor.btnColor = Color(0xFF6AC045);
        appColor.dWhite = const Color(0xFF1A1D1F);
        iconAddress = Icon(Icons.sunny);
        AdaptiveTheme.of(context).setDark();
        darkmode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appColor.dWhite,
      leadingWidth: 100,
      leading: Row(children: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Image.asset(
            "assets/images/fav.png",
          ),
        ),
      ]),
      actions: [
        Row(
          children: [
            GestureDetector(
                onTap: () async {
                  final logged = await SharedPreferences.getInstance();
                  logged.setBool("isLoggedIn", false);
                  print(storage);
                  storage.deleteAll();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/profile-imgs/img-13.jpg",
                  ),
                )),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Stack(children: [
            MaterialButton(
              elevation: 0,
              height: 40,
              color: appColor.btnColor,
              onPressed: () {
                getCurrentTheme();
              },
              shape: const CircleBorder(),
              child: darkmode ? const FaIcon(FontAwesomeIcons.solidMoon) :const FaIcon(FontAwesomeIcons.solidSun),
            )
          ]),
        )
      ],
      centerTitle: true,
    );
  }
}

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isHover = false;

  final List eventList = [
    {
      "title": "Grand Royl Event",
      "place": "Wembley, London",
      "distance": 2,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "100",
    },
    {
      "title": "Queen Hotel",
      "place": "Grand Royl Event",
      "distance": 3,
      "review": 13,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "200",
    },
    {
      "title": "Hilton",
      "place": "Wembley, London",
      "distance": 6,
      "review": 88,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "150",
    },
    {
      "title": "Grand Royl Event",
      "place": "Wembley, London",
      "distance": 11,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "700",
    },
    {
      "title": "Grand Royl Event",
      "place": "Wembley, London",
      "distance": 2,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "1000",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.dBackgroud,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Container()],
            ),
          ),
          Column(
            children: eventList.map((hotel) {
              return eventCard(hotelData: hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class eventCard extends StatelessWidget {
  final Map hotelData;

  const eventCard({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          color: appColor.dWhite,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage(hotelData['picture']), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 5,
                    right: -15,
                    child: MaterialButton(
                      color: appColor.dGreen,
                      onPressed: () {},
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 20,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ ${hotelData['price']}",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: appColor.dGreen,
                      size: 14,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${hotelData['review'].toString()} Review",
                  style: GoogleFonts.nunito(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
