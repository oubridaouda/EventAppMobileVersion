import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);
const d_grey = Color(0xFF424242);

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
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: d_grey,
          size: 20,
        ),
        onPressed: () {},
      ),
      title: Text(
        'Event',
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
           Center(
            child: Text("Home Page",
                style: GoogleFonts.nunito(
                    color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
            ),
          ),
           Center(
            child: Text("Home Page",
                style: GoogleFonts.nunito(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
           Center(
            child: Text("Home Page",
                style: GoogleFonts.nunito(
                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {},
            onHover: (val) {
              setState(() {
                isHover = val;
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black45;
                    } //<-- SEE HERE
                    return null; // Defer to the widget's default.
                  },
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Connexion",
                style: TextStyle(fontSize: 20),
              ),
            ),
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
                      color: Colors.white,
                      onPressed: () {},
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: d_green,
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
                      color: d_green,
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
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_border,
                      color: d_green,
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
