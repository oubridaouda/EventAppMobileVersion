import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/menu/appNavBar.dart';
import 'package:event_mobile_app/screen/menu/drawer.dart';
import 'package:event_mobile_app/screen/menu/toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';

class HomePage extends StatefulWidget {
  final bool? loginStatus;
  final String text;

  const HomePage({Key? key, this.loginStatus = false, this.text = ""})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "homeScreen");
  bool? isLogged = false;
  final Future<SharedPreferences> _shareStorage =
      SharedPreferences.getInstance();

  String? selectEventType;
  String? selectCity;
  final List<String> eventListType = ["All", "Arts", "Business", 'Coaching and Consulting', 'Community and Culture', 'Education and Training', 'Family and Friends', 'Fashion and Beauty'];


  Future<bool?> getStorage() async {
    final logged = await SharedPreferences.getInstance();
    isLogged = logged.getBool("isLoggedIn") ?? false;

    print("is logginStatus ${widget.loginStatus}");
    return isLogged;
  }

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "homeScreen");
    super.initState();
    getStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(scaffoldKey: _scaffoldKey),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 70, bottom: 80),
              alignment: Alignment.center,
              color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
              child: Column(
                children: [
                  const Text(
                    "Discover Events For All The Things You Love",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ToggleButton(),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                      showSelectedItems: true,
                      menuProps: MenuProps()
                    ),
                    items:  eventListType,
                    dropdownDecoratorProps:  DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        // labelText: "Menu mode",
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: "Type of event",
                        filled: true,
                        fillColor: darkMode ? darkColor.dWhite : lightColor.dWhite,
                        enabledBorder: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: const BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: darkMode
                                ? darkColor.InputColor
                                : lightColor.InputBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: const BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: lightColor.InputBorderColor,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    onChanged: ((value) {
                      print(value);
                      selectEventType = value;
                      print(toggleEventType);
                    }),
                    selectedItem: selectEventType,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: const ["Ouagadougou", "Lomé", "Brazzaville", 'Abidjan'],
                    dropdownDecoratorProps:  DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        // labelText: "Menu mode",
                        hintText: "City",
                        filled: true,
                        fillColor: darkMode ? darkColor.dWhite : lightColor.dWhite,
                        enabledBorder: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: darkMode
                                ? darkColor.InputColor
                                : lightColor.InputBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: lightColor.InputBorderColor,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    onChanged: ((value) {
                      print(value);
                      selectCity = value;
                    }),
                    selectedItem: selectCity,
                  ),
                  // DropdownButtonHideUnderline(
                  //   child: ButtonTheme(
                  //     alignedDropdown: true,
                  //     child: DropdownButton(
                  //       hint: const Text("Select Event Type"),
                  //       value: _selected,
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           _selected = newValue;
                  //         });
                  //       },
                  //       items: _myJson.map((myItem) {
                  //         print(
                  //             "${myItem["value"]} and select: $_selected and id: ${myItem["id"]}");
                  //         return DropdownMenuItem(
                  //           value: myItem["id"].toString(),
                  //           child: Row(
                  //             children: [
                  //               Icon(myItem["icon"]),
                  //               Text(myItem["value"]),
                  //             ],
                  //           ),
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor:
                            darkMode ? darkColor.dGreen : lightColor.dGreen,
                      ),
                      onPressed: () async {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Find",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            EventScreen()
          ],
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
      "title": "A New Way Of Life",
      "place": "Wembley, London",
      "distance": 2,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "100",
    },
    {
      "title": "Earrings Workshop with Bronwyn David",
      "place": "Grand Royl Event",
      "distance": 3,
      "review": 13,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "200",
    },
    {
      "title": "Spring Showcase Saturday April 30th 2022 at 7pm",
      "place": "Wembley, London",
      "distance": 6,
      "review": 88,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "150",
    },
    {
      "title": "Shutter Life",
      "place": "Wembley, London",
      "distance": 11,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "700",
    },
    {
      "title": "Friday Night Dinner at The Old Station May 27 2022",
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
      color: darkMode ? darkColor.firstBackground : lightColor.firstBackground,
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
        color:
            darkMode ? darkColor.thirdBackground : lightColor.thirdBackground,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20, bottom: 20, left: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          hotelData['title'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("AUD \$${hotelData['price']}*",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      Text("7 Remaining",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                          )),
                    ],
                  ),
                ]),
          ),
          Container(
            color:
                darkMode ? darkColor.fiveBackground : lightColor.fiveBackground,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.calendarDay,
                      color: darkMode ? Colors.grey[500] : lightColor.dGreen,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "15 Apr Fri, 3.45 PM",
                      style: GoogleFonts.nunito(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidClock,
                      color: darkMode ? Colors.grey[500] : lightColor.dGreen,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "1h",
                      style: GoogleFonts.nunito(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
