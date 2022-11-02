import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/menu/appNavBar.dart';
import 'package:event_mobile_app/screen/menu/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_mobile_app/colors/colors.dart';


GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  final bool? loginStatus;
  final String text;

  const HomePage({Key? key, this.loginStatus = false, this.text = ""})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

void signUp() {
  _googleSignIn.disconnect();
}

class _HomePageState extends State<HomePage> {
  GoogleSignInAccount? _currentUser;
  bool? isLogged = false;
  final Future<SharedPreferences> _shareStorage =
  SharedPreferences.getInstance();

  Future<bool?> getStorage() async {
    final logged = await SharedPreferences.getInstance();
    isLogged = logged.getBool("isLoggedIn") ?? false;

    print("is logginStatus ${widget.loginStatus}");
    return isLogged;
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        setState(() {
          _currentUser = account;
        });
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
    getStorage();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    print("is logged : ${widget.loginStatus!} and user $user out of");
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(scaffoldKey: _scaffoldKey),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: [EventScreen()],
        ),
      ),
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
      color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
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
        color: darkMode ? darkColor.dWhite : lightColor.dWhite,
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
                      color: darkMode ? darkColor.dGreen : lightColor.dGreen,
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
                      color: darkMode ? darkColor.dGreen : lightColor.dGreen,
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