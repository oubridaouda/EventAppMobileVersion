import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/menu/toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventListScreenView extends StatefulWidget {
  const EventListScreenView({Key? key}) : super(key: key);

  @override
  State<EventListScreenView> createState() => _EventListScreenViewState();
}

class _EventListScreenViewState extends State<EventListScreenView> {
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
              return EventCard(hotelData: hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}


class EventCard extends StatelessWidget {
  final Map hotelData;

  const EventCard({Key? key, required this.hotelData}) : super(key: key);

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
            padding:
            const EdgeInsets.only(top: 15, right: 20, bottom: 20, left: 20),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      const Text("7 Remaining",
                          style: TextStyle(
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
            padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                      style: TextStyle(
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
                      style: TextStyle(
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
