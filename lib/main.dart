import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const dGreen = Color(0xFF6AC045);
const dGrey = Color(0xFF717171);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [EventScreen()],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 100,
      leading: Row(children: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Image.asset(
            "assets/images/fav.png",
          ),
        ),
      ]),
      actions: [
        const CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/profile-imgs/img-13.jpg",
          ),
        ),
        Stack(children: [
          MaterialButton(
            elevation: 0,
            height: 40,
            color: Color(0XFAF5F5FF),
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(
              Icons.sunny,
              color: dGrey,
              size: 20,
            ),
          )
        ])
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

  final List hotelList = [
    {
      "title": "Grand Royl Hotels",
      "place": "Wembley, London",
      "distance": 2,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "100",
    },
    {
      "title": "Queen Hotel",
      "place": "Grand Royl Hotels",
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
      "title": "Grand Royl Hotels",
      "place": "Wembley, London",
      "distance": 11,
      "review": 36,
      "picture": "assets/images/event-imgs/img-2.jpg",
      "price": "700",
    },
    {
      "title": "Grand Royl Hotels",
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
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("550 hotels founds",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                Row(children: [
                  Text("Filters",
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list_outlined,
                        color: dGreen,
                        size: 25,
                      ))
                ])
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotelData: hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;

  const HotelCard({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(18)),
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
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
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
                Text("\$ ${hotelData['price']}",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hotelData['place'],
                    style: GoogleFonts.nunito(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: dGreen,
                      size: 14.0,
                    ),
                    Text("${hotelData['distance'].toString()} km to city",
                        style: GoogleFonts.nunito(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ))
                  ],
                ),
                Text('Per night',
                    style: GoogleFonts.nunito(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
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
                      Icons.star_rate,
                      color: dGreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dGreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dGreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dGreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_border,
                      color: dGreen,
                      size: 14,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("${hotelData['review'].toString()} Review",
                    style: GoogleFonts.nunito(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
