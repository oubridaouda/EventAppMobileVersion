import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/menu/drawer.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DuckEvent',
      home: isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(scaffoldKey: _scaffoldKey),
      appBar:  MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [EventScreen()],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);
  final storage = FlutterSecureStorage();

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
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
            Icon(
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
              color: dBackgroud,
              onPressed: () {},
              shape: const CircleBorder(),
              child: const Icon(
                Icons.sunny,
                color: dGrey,
                size: 20,
              ),
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
      color: dBackgroud,
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
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 3)),
          ]),
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
                      color: dGreen,
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
                    color: Colors.black,
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
                      color: Colors.black,
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
                  children: const [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: dGreen,
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
