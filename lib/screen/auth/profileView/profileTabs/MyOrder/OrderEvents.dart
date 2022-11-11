import 'package:event_mobile_app/screen/auth/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:event_mobile_app/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderEvents extends StatefulWidget {
  const OrderEvents({Key? key}) : super(key: key);

  @override
  State<OrderEvents> createState() => _OrderEventsState();
}

class _OrderEventsState extends State<OrderEvents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: darkMode ? darkColor.dWhite : lightColor.dWhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160.0,
              padding:
              const EdgeInsets.only(left: 12, right: 12, top: 70, bottom: 80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
                image: const DecorationImage(
                  image: AssetImage("assets/images/profile-imgs/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Tutorial on Canvas Painting for Beginners",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Invoice ID : BRCCRW-11111111"),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: lightColor.dBackgroud,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            radius: 125,
                            backgroundColor: darkMode
                                ? darkColor.dGrey
                                : lightColor.InputColor,
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.calendarDays,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Event Starts on",
                          style: TextStyle(color: lightColor.dGrey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "01 June 2022",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            radius: 125,
                            backgroundColor: darkMode
                                ? darkColor.dGrey
                                : lightColor.InputColor,
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.ticket,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total Tickets",
                          style: TextStyle(color: lightColor.dGrey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "1",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            radius: 125,
                            backgroundColor: darkMode
                                ? darkColor.dGrey
                                : lightColor.InputColor,
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Paid Amount",
                          style: TextStyle(color: lightColor.dGrey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "AUD \$50.00",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            radius: 125,
                            backgroundColor: darkMode
                                ? darkColor.dGrey
                                : lightColor.InputColor,
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Invoice",
                          style: TextStyle(color: lightColor.dGrey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ResetPassword()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Download",
                                style: TextStyle(
                                    color: lightColor.dGreen, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
              ],
            )
          ],
        ),
      )],
    );
  }
}
